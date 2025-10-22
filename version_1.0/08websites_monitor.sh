# shell script that monitors a list of websites and sends an email notification if any of them are down.
#/bin/bash

#email="kaivalya.bachkar@gmail.com"
read -p "Enter the name of the website: " site

status="$(curl -Is $site | head -n 1 | awk '{print $2}')"
if ((status != 200)); then
        echo "$site is down Status code: $status" 
	#| mail -s "ALERT: $site is down" "$email"
else
        echo "$site is up Status code: $status"
fi
