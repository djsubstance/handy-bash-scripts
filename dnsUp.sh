#!/bin/bash
# 
# Top -> down DNS recursion and authority lookup
# Usage: ./dnsUp.sh <example.com>
# 
#

# if no args [$1+] then fail
if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1

echo "Querying DNS information for $DOMAIN..."
echo

# Check if the DNS server is recursive
echo "Checking if the DNS server is recursive for $DOMAIN..."
RECURSIVE_CHECK=$(dig +short $DOMAIN @8.8.8.8)

if [ -z "$RECURSIVE_CHECK" ]; then
    echo "The DNS server does not seem to be recursive for $DOMAIN."
else
    echo "The DNS server is recursive for $DOMAIN."
fi

echo

# Get the authoritative DNS servers for the domain
echo "Identifying authoritative DNS servers for $DOMAIN..."
AUTH_DNS=$(dig +short NS $DOMAIN)

if [ -z "$AUTH_DNS" ]; then
    echo "No authoritative DNS servers were found for $DOMAIN."
else
    echo "Authoritative DNS servers for $DOMAIN:"
    echo "$AUTH_DNS"
fi

echo

# Get additional info for each authoritative DNS server
echo "Gathering more information about each authoritative DNS server..."
for DNS in $AUTH_DNS; do
    echo "Information for $DNS:"
    dig +short $DNS
    echo
done

# Get WHOIS information for the domain
echo "Gathering WHOIS information for $DOMAIN..."
whois $DOMAIN | egrep -i 'Registrar:|Registrant:'
echo

echo "Script execution completed."
