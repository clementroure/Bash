function strip_html(){
        grep -oP '(?<=<span class="no-wrap" data-price-btc).*?(?=</span>)' $output >temp.txt

        sed -i 's/[^>]*>//g' temp.txt >$output
        sed -ni '1p' temp.txt >$output
        cp temp.txt $output
        rm temp.txt
}
function print(){
        while read price  
        do
                val=$price
        done <$output
        echo "The price of Bitcoin  is = $val"
}
function send(){

        telegram_api_url=$(head -n 1 telegram_api_url.txt)
        date_now="$(date +'%d/%m/%Y')"
        hour_now="$(date +'%H:%M:%S')"
        curl -s "$telegram_api_url&text=The%20price%20of%20$coin%20is%20$val%20($date_now%20$hour_now)"
}


url='https://www.coingecko.com/en/coins/bitcoin'
output=price.txt
touch $output temp.txt
curl -o $output $url
strip_html
print
send