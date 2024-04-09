Filename: getIPs.sh
Should work perfect on Centos, Darwin, Ubuntu - others might need modification 
Desc:  Displays all interfaces and IPs in a nice format
Prereqs: none

Script:
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
    interfaces=($(ip -o link show | awk -F': ' '{print $2}' | tr -d '@'))

    for intf in "${interfaces[@]}"; do
        # Get the IP address and subnet mask
        ip_and_mask=$(ip -o -f inet addr show $intf | awk '{print $4}')
        echo "$intf: $ip_and_mask"
    done
fi

-----
example output on Centos (Oracle):
 uname -a -> Linux labinstance1 5.15.0-203.146.5.1.el9uek.x86_64 #2 SMP Thu Feb 8 17:13:58 PST 2024 x86_64 x86_64 x86_64 GNU/Linux
--------------
lo: 127.0.0.1/8
ens3: 10.0.3.0/16
10.0.3.1/16
10.0.3.2/16
tun0: 10.8.4.9/24
lo: 127.0.0.1/8
ens3: 10.0.3.0/16
10.0.3.1/16
10.0.3.2/16
tun0: 10.8.4.9/24





Example on Ubuntu 22:
 uname -a -> Linux Vultr5 6.2.0-1018-aws #18~22.04.1-Ubuntu SMP Wed Jan 10 22:54:16 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux

lo: 127.0.0.1/8
eth0: 172.31.11.155/20
tun0: 10.8.4.2/24
lo: 127.0.0.1/8
eth0: 172.31.11.155/20
tun0: 10.8.4.2/24




