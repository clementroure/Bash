Project 2 : API calls + Postgresql + HTTPS + Data analysis

In this project, we retrieve the price of Bitcoin (in usd) thanks to the API of Coinbase (https://docs.cloud.coinbase.com/sign-in-with-coinbase/docs/api-prices)

'main.sh' is hosted on an Digital Ocean linux-based VM. 
Thanks to the command $sudo crontab -e  we can setup a config file:
0 17 * * * /usr/bin/bash /root/esilv/auto_scraper.sh

'main.sh' will send a message with the bitcoin price in usd, everyday at 5pm, via a Telegram bot.