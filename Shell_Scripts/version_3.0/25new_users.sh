#####################################################################
# Script Name : new_user.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that generates and emails a report of newly created user accounts on a Linux system within the last 24 hours.
####################################################################

#!/bin/bash

function MAIL () { 
echo -e "Hello All 
                This is system generated email, do not reply to this email.
                New Users Report (Last 24h)" < "$REPORT_FILE"
                Kindly take necessary action ASAP to avoid future inconvenience. 
                Server Name : - `hostname` 
                Server IP :- `ifconfig | grep inet | head -n 1 | awk '{print $2}'` 
 
Thank & Regards 
  
Team CloudEthix" 
}

REPORT_FILE="/tmp/new_users_report.txt"
SINCE=$(date -d '24 hours ago' +%s)
echo "New users in last 24h:" > $REPORT_FILE

awk -F: '$3>=1000 {print $1":"$6}' /etc/passwd | while IFS=: read user home; do
  [ -d "$home" ] && [ $(stat -c %Y "$home") -ge $SINCE ] && echo "$user ($home)" >> $REPORT_FILE
done

echo "Report saved to $REPORT_FILE"

if grep -q "(" "$REPORT_FILE"; then
    MAIL
    echo "Email sent successfully."
else
    echo "No new users found in the last 24 hours."
fi
