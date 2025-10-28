#####################################################################
# Script Name : websites_monitor.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that monitors a list of websites and sends an email notification if any of them are down
####################################################################

#!/bin/bash

function MAIL () {
echo -e "Hello All
                This is system generated email, do not reply to this email.
                $SITE appears DOWN (Status Code: $STATUS)
                Kindly take necessary action ASAP to avoid future inconvenience. 
                Server Name : - `hostname`
                Server IP :- `ifconfig | grep inet | head -n 1 | awk '{print $2}'` 

Thank & Regards

Team CloudEthix"
}

SITE=$1

if [ $# -ne 1 ] || [ -z "$SITE" ] || ! command -v curl &>/dev/null; then
    echo "Usage: $0 <website>"
    [ -z "$SITE" ] && echo "Error: No website entered."
    ! command -v curl &>/dev/null && echo "Error: curl command not found. Install it using: sudo yum install curl -y"
    exit 1
fi

STATUS=$(curl -Is --max-time 10 -o /dev/null -w "%{http_code}" "$SITE" 2>/dev/null || echo "000")

if [[ "$STATUS" =~ ^[0-9]{3}$ ]]; then
    if [[ "$STATUS" -eq 200 || "$STATUS" -eq 301 || "$STATUS" -eq 302 ]]; then
        echo "$SITE is UP (Status Code: $STATUS)"
    else
        echo "$SITE appears DOWN (Status Code: $STATUS)"
        MAIL
    fi
else
    echo "Failed to retrieve status from $SITE (Invalid response or connection error)"
fi
