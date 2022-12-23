function send(){

        telegram_api_url=$(head -n 1 telegram_api_url.txt)
        date_now="$(date +'%d/%m/%Y')"
        hour_now="$(date +'%H:%M:%S')"
        curl -s "$telegram_api_url&text=The%20price%20of%20Bitcoin%20is%20$price%20USD%20($date_now%20$hour_now)%0A%0AChange%20the%20alert%20threshold%20here:%20https://lordly.online"
}
function saveToSQL(){

        database="test"
        #PGPASSWORD='fez54f5ezf' psql -U postgres -d $database -c "CREATE TABLE public.prices(price integer, date date)"

        date_now="$(date +'%d/%m/%Y')"
        PGPASSWORD='fez54f5ezf' psql -U postgres -d $database -c "INSERT INTO public.prices VALUES ($price ,$date_now)"
}

curl https://api.coinbase.com/v2/prices/BTC-USD/spot \
  -H 'Authorization: Bearer abd90df5f27a7b170cd775abf89d632b350b7c1c9d53e08b340cd9832ce52c2c' -o data.txt
  price=$(grep -oP '"amount": *"\K[^"]*' data.txt)
  echo $price "$output" > price.txt
  echo "BTC Price is:" $price "USD"
  rm -r data.txt
  rm -r price.txt
  saveToSQL
  send