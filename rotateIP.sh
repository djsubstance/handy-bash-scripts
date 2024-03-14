# rotate IP if you have multihomed


#!/bin/bash

# Define your IPs and interface
IP1="155.x.x.x"
IP2="155.138.x.x"
IP3="216.128.x.x"   #replace
INTERFACE="enp1s0"  #replace
STATE_FILE="/tmp/ip_rotate.state"

# Determine the current IP
if [ ! -f "$STATE_FILE" ]; then
    CURRENT_IP="$IP1"
else
    CURRENT_IP=$(cat $STATE_FILE)
fi

# Determine the next IP based on the current IP
if [ "$CURRENT_IP" == "$IP1" ]; then
    NEXT_IP="$IP2"
elif [ "$CURRENT_IP" == "$IP2" ]; then
    NEXT_IP="$IP3"
else
    NEXT_IP="$IP1"
fi

# Update the state file with the next IP
echo "$NEXT_IP" > "$STATE_FILE"

# Remove existing SNAT rules for the IPs
sudo iptables -t nat -D POSTROUTING -o $INTERFACE -j SNAT --to-source $IP1 2>/dev/null
sudo iptables -t nat -D POSTROUTING -o $INTERFACE -j SNAT --to-source $IP2 2>/dev/null
sudo iptables -t nat -D POSTROUTING -o $INTERFACE -j SNAT --to-source $IP3 2>/dev/null

# Add the new SNAT rule for the next IP
sudo iptables -t nat -A POSTROUTING -o $INTERFACE -j SNAT --to-source $NEXT_IP


echo "Rotated outgoing IP to $NEXT_IP"
