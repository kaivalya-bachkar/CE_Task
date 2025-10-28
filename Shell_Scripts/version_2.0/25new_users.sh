#####################################################################
# Script Name : new_users.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that generates and emails a report of newly created user accounts on a Linux system within the last 24 hours
####################################################################

#!/bin/bash

SINCE=$(date -d '24 hours ago' +%s)

echo "New users in last 24h:" > /tmp/new_users_report.txt

awk -F: '$3>=1000 {print $1":"$6}' /etc/passwd | while IFS=: read user home; do
  [ -d "$home" ] && [ $(stat -c %Y "$home") -ge $SINCE ] && echo "$user ($home)" >> /tmp/new_users_report.txt
done

echo "Report saved to /tmp/new_users_report.txt"
