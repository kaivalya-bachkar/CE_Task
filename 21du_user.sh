#shell script that calculates the total disk space used by a specified user and outputs the result.

#!/bin/bash

read -p "Enter Username To check its Disk Usages:" username

total_usage=$(sudo du -shc /home/"$username" | grep total | awk '{print $1}')

echo "Total disk space used by user '$username': $total_usage"
