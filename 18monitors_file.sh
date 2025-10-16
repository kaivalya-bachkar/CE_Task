#/bin/bash

read -p "Enter the full path of the file to monitor: " file

echo "Monitoring changes in '$file'"

stat $file
