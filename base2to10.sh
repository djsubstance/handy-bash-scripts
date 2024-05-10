#!/bin/bash

# Convert IPv4 address to base 10

# Check if an argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <IPv4 address>"
    exit 1
fi

# Split the IP address into octets
IFS='.' read -r -a octets <<< "$1"

# Verify that we have exactly four octets
if [ ${#octets[@]} -ne 4 ]; then
    echo "Error: Invalid IP address format."
    exit 1
fi

# Convert each octet from base 10 to base 256 and sum them up
ip_decimal=$(( (octets[0] * 256**3) + (octets[1] * 256**2) + (octets[2] * 256) + octets[3] ))

# Output the result
echo "Decimal format of IP $1 is: $ip_decimal"

