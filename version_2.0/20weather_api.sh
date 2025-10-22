#####################################################################
# Script Name : weather_api.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that retrieves the current weather for a specified location using a weather API.
####################################################################

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <city_name>"
    exit 1
fi

CITY=$1

API_KEY="2c3fa31e0118b0351114eb80c781c597"

URL="https://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${API_KEY}&units=metric"

RESPONSE=$(curl -s "$URL")

if echo "$RESPONSE" | grep -q '"cod":"404"'; then
    echo "City '$CITY' not found."
    exit 1
fi

TEMP=$(echo "$RESPONSE" | jq '.main.temp')
WEATHER=$(echo "$RESPONSE" | jq -r '.weather[0].description')
HUMIDITY=$(echo "$RESPONSE" | jq '.main.humidity')
WIND_SPEED=$(echo "$RESPONSE" | jq '.wind.speed')

echo "Weather in $CITY:"
echo "Temperature: ${TEMP}°C"
echo "Condition: $WEATHER"
echo "Humidity: ${HUMIDITY}%"
echo "Wind Speed: ${WIND_SPEED} m/s"
