#!/bin/bash

# Detect the operating system
OS=$(uname -s)

if [ "$OS" = "Darwin" ]; then
    # macOS commands
    interfaces=($(ifconfig | grep '^[a-z]' | awk '{print $1}' | tr -d ':'))
    for intf in "${interfaces[@]}"; do
        ip_and_mask=$(ifconfig $intf | grep 'inet ' | awk '{print $2, $4}')
        echo "$intf: $ip_and_mask"
    done
elif [ "$OS" = "Linux" ]; then
    # Linux commands
    interfaces=($(ip -o link show | awk -F': ' '{print $2}' | tr -d '@'))
    for intf in "${interfaces[@]}"; do
        ip_and_mask=$(ip -o -f inet addr show $intf | awk '{print $4}')
        echo "$intf: $ip_and_mask"
    done
else
    echo "Unsupported operating system."
fi


# Detect the operating system in a case-insensitive manner
OS=$(uname -s)

if [[ "${OS,,}" == "darwin" ]]; then
    # macOS commands
    # Populate the interfaces array
    interfaces=($(ifconfig | grep '^[a-z]' | awk '{print $1}' | tr -d ':'))

    # Loop through each interface
    for intf in "${interfaces[@]}"; do
        # Get the IP address and subnet mask
        ip_and_mask=$(ifconfig $intf | grep 'inet ' | awk '{print $2, $4}')
        echo "$intf: $ip_and_mask"
    done
else
    # Linux commands
    # Ensure interfaces array is populated
    interfaces=($(ip -o link show | awk -F': ' '{print $2}' | tr -d '@'))

    # Loop through each interface
    for intf in "${interfaces[@]}"; do
        # Get the IP address and subnet mask
        ip_and_mask=$(ip -o -f inet addr show $intf | awk '{print $4}')
        echo "$intf: $ip_and_mask"
    done
fi



-- example output
./ips.sh 
lo: 127.0.0.1/8
eth0: 55.207.92.220/20
10.10.0.5/16
eth1: 10.116.0.2/20
docker0: 172.17.0.1/16
tun0: 10.8.4.3/24
lo: 127.0.0.1/8
eth0: 87.207.192.20/20
10.10.0.5/16
eth1: 10.116.0.2/20
docker0: 172.17.0.1/16
tun0: 10.8.4.3/24

--- As you can see this cleans up the output a bit. nothing amazing but helpful


