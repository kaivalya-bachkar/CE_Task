#script that backs up a specified directory to a remote server using rsync and SSH
# rsync -avz -e ssh /backup/daily/ user@remote-server:/remote/backup/

#!/bin/bash

read -p "Enter a specified directory path :" path
read -p "Enter a Remote Server Username : " user
read -p "Enter a Remote Server Ip Address :" remote_ip
read -p "Enter a path to save the files in Remote Server : " remote_path

rsync -avz -e ssh $path $user@$remote_ip:$remote_path
