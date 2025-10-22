#!/bin/bash

Threshold=40
df -h / | egrep -v "Filesystem|tmpfs" > /tmp/df.txt
while read C1 C2 C3 C4 C5 C6
do
	CHK=`echo $C5 | cut -d'%' -f1`
	if [[ $CHK -gt $Threshold ]]
	then
		echo -e "\n**********WARNING**********"
		echo -e "\nyour Disk Utilization of $C6 is Reached to Threshold $C5"
		echo "Mail to User For Disk Alert"
	else
		echo -e "\nYour Disk Utilization is Under Threshold $C5"
	fi
done < /tmp/df.txt

