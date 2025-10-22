#####################################################################
# Script Name : websites_monitor.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that monitors a list of websites and sends an email notification if any of them are down
####################################################################

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 web_site"
    exit 1
fi

SITE=$1

if [[ -z "$SITE" ]]; then
    echo "Error: No website entered."
    exit 1
fi

if ! command -v curl &>/dev/null; then
    echo "Error: curl command not found. Install it using:"
    echo "sudo yum install curl -y"
    exit 1
fi

STATUS=$(curl -Is --max-time 10 -o /dev/null -w "%{http_code}" "$SITE" 2>/dev/null || echo "000")

if [[ "$STATUS" =~ ^[0-9]{3}$ ]]; then
    if [[ "$STATUS" -eq 200 || "$STATUS" -eq 301 || "$STATUS" -eq 302 ]]; then
        echo "$SITE is UP (Status Code: $STATUS)"
    else
        echo "$SITE appears DOWN (Status Code: $STATUS)"
        # echo "$SITE is down (Status Code: $STATUS)" | mail -s "ALERT: $SITE is DOWN" "$EMAIL"
    fi
else
    echo "Failed to retrieve status from $SITE (Invalid response or connection error)"
fi

