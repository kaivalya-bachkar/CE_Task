#Shellscript that checks for and reports any failed SSH login attempts on a Linux server.

#!/bin/bash

echo "Checking for the Failed SSH Login Attempts on $(date):" >> ssh_failed.txt

sudo grep sshd.\*Failed /var/log/secure >> ssh_failed.txt
echo "-----------------------------------------------------------------------" >> ssh_failed.txt
echo "Report for failed SSH login attempts on a Linux server is Created Check it on ssh_failed.txt"
