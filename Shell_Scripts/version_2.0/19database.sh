#####################################################################
# Script Name : database.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that automates the process of creating a new MySQL database, user, and granting privileges.
####################################################################

#!/bin/bash

if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <Database_name> <Username> <Password>"
    exit 1
fi

DB_NAME=$1
DB_USER=$2
DB_PASS=$3

MYSQL_ROOT_PASSWORD="Pass@123"

mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

if [ $? -eq 0 ]; then
    echo "MySQL database '$DB_NAME', user '$DB_USER', and privileges created successfully."
else
    echo "Error: Failed to create MySQL database, user, or grant privileges."
    exit 1
fi
