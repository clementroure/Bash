Project 1 : Web Scraping + Telegram bot

In this project, we retrieve the price of a cryptocurrency by scrapping coingecko.com (exemple: https://www.coingecko.com/en/coins/bitcoin)

1) We can run the script 'manual_scraper.sh' manually and retrieve the current price (in usd) of the cryptocurrency we want, by specifying
its symbol (btc, eth, ...)

2) The 2nd script 'auto_scraper.sh' is hosted on an Digital Ocean linux-based VM. 
Thanks to the command $sudo crontab -e  we can setup a config file:
0 17 * * * /usr/bin/bash /root/esilv/auto_scraper.sh

auto_scraper.sh will send a message with the bitcoin price in usd, everyday at 5pm, via a Telegram bot.