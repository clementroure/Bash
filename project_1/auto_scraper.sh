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

        curl -s "https://api.telegram.org/bot5605775877:AAEHetqxBeeG2soFBFBIZ_zIss5VaiJ9Q5A/sendMessage?chat_id=1796336770&text=The_price_of-Bitcoin_is_$val"
}

url='https://www.coingecko.com/en/coins/bitcoin'
output=price.txt
touch $output temp.txt
curl -o $output $url
strip_html
print
send