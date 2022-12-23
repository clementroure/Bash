Project 2 : API calls + Postgresql + HTTPS Website + Alert threshold

In this project, we retrieve the price of Bitcoin (in usd) thanks to the API of Coinbase (https://docs.cloud.coinbase.com/sign-in-with-coinbase/docs/api-prices)

If the Bitcoin price drop more than the alrt thresold (exemple:5 %) in 24H, @steeve549_bot will send a message with additionals informations.

You can change the alert treshold here: https://lordly.online

Each 5 minuts, we retrieve the current price and save it with the date, in the server hosted Postgresql databse.


Par contre, je n'ai pas fait d'historique des alertes car je n'arrive pas à enregistrer la date dans le bon format pour Postgresql et je ne peux donc pas exploiter cette donnée.