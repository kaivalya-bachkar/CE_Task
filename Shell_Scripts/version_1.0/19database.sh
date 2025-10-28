# Shell script that automates the process of creating a new MySQL database, user, and granting privileges.

#!/bin/bash

read -s -p "Enter MySQL root password: " MYSQL_ROOT_PASSWORD
read -p "Enter new MySQL database name: " DB_NAME
read -p "Enter new MySQL username: " DB_USER
read -s -p "Enter new MySQL user password: " DB_PASS

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
