#####################################################################
# Script Name : new_host.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that automates the process of setting up a new virtual host on a web server.
####################################################################

#!/bin/bash

[ "$EUID" -ne 0 ] && echo "Run as root" && exit 1

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <domain> "
    exit 1
fi

DOMAIN=$1

DIR="/var/www/$DOMAIN"
CONF="/etc/httpd/conf.d/$DOMAIN.conf"

mkdir -p "$DIR"
echo "$DOMAIN is live!" > "$DIR/index.html"

cat > "$CONF" <<EOF
<VirtualHost *:80>
    ServerName $DOMAIN
    DocumentRoot $DIR
</VirtualHost>
EOF

systemctl reload httpd
echo "$DOMAIN virtual host created!"
