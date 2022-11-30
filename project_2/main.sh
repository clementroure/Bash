function send(){

         curl -s "https://api.telegram.org/bot5605775877:AAEHetqxBeeG2soFBFBIZ_zIss5VaiJ9Q5A/sendMessage?chat_id=1796336770&text=The%20Price%20of%20Bitcoin%20is%20$price%20usd"
}

curl https://api.coinbase.com/v2/prices/BTC-USD/spot \
  -H 'Authorization: Bearer abd90df5f27a7b170cd775abf89d632b350b7c1c9d53e08b340cd9832ce52c2c' -o data.txt
  price=$(grep -oP '"amount": *"\K[^"]*' data.txt)
  echo $price "$output" > price.txt
  echo "BTC Price is:" $price "USD"
  send