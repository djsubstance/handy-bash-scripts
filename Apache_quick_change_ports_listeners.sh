

#!/bin/bash

# Function to display help
show_help() {
    echo "Usage: $0 {vpn|all}"
    echo "  vpn : Configure Apache to listen on VPN IPs only."
    echo "  all : Configure Apache to listen on all IPs."
}

# Check if the user provided an argument
if [ -z "$1" ]; then
    show_help
    exit 1
fi

# Convert the argument to lowercase
mode=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# Backup the current ports.conf file
sudo cp /etc/apache2/ports.conf /etc/apache2/ports.conf.bak

case "$mode" in
    vpn)
        sudo cp /etc/apache2/ports_vpn.conf /etc/apache2/ports.conf
        sudo service apache2 restart
        echo 'Restarted apache2 listening on VPN IPs only'
        ss -antl | grep '80\|443'
        ;;
    all)
        sudo cp /etc/apache2/ports_open.conf /etc/apache2/ports.conf
        sudo service apache2 restart
        echo 'Restarted apache2 listening on ALL IPs only'
        ss -antl | grep '80\|443'
        echo
        echo 'This should reflect *:443 / *:80'
        ;;
    *)
        show_help
        exit 1
        ;;
esac


