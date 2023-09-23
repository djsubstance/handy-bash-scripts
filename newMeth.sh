This script will make a bash array of the HTTP methods and try them on your target domain
here is sample output
 ./newmeth.sh msn.com
Subdomain: msn
Prefix: 
Domain: com
[ Url: msn.com ] : : GET - Code: HTTP/2 301 
[ Url: msn.com ] : : HEAD - Code: HTTP/2 301 
[ Url: msn.com ] : : POST - Code: HTTP/2 411 
[ Url: msn.com ] : : PUT - Code: HTTP/2 411 
[ Url: msn.com ] : : DELETE - Code: HTTP/2 301 
[ Url: msn.com ] : : CONNECT - Code: 
[ Url: msn.com ] : : OPTIONS - Code: HTTP/2 301 
[ Url: msn.com ] : : TRACE - Code: HTTP/2 301 
[ Url: msn.com ] : : PATCH - Code: HTTP/2 301 
[ Url: www.msn.com ] : : GET - Code: HTTP/2 200 
[ Url: www.msn.com ] : : HEAD - Code: HTTP/2 404 
[ Url: www.msn.com ] : : POST - Code: HTTP/2 411 
[ Url: www.msn.com ] : : PUT - Code: HTTP/2 411 
[ Url: www.msn.com ] : : DELETE - Code: HTTP/2 405 
[ Url: www.msn.com ] : : CONNECT - Code: 
[ Url: www.msn.com ] : : OPTIONS - Code: HTTP/2 405 
[ Url: www.msn.com ] : : TRACE - Code: HTTP/2 405 
[ Url: www.msn.com ] : : PATCH - Code: HTTP/2 405 




#!/bin/bash

# Define an array of valid remote web server methods
METHODS=("GET" "HEAD" "POST" "PUT" "DELETE" "CONNECT" "OPTIONS" "TRACE" "PATCH")

splitDomain() {
    local input="$1"
    
    # Remove http(s) if present
    input="${input#http://}"
    input="${input#https://}"
    
    # Remove www prefix
    if [[ "$input" == www.* ]]; then
        prefix="www"
        domain="${input#www.}"
        subdomain=""
    else
        # Split into subdomain and domain
        IFS='.' read -ra parts <<< "$input"
        subdomain="${parts[0]}"
        prefix=""
        domain=""
        for ((i=1; i<${#parts[@]}; i++)); do
            if [ -n "$domain" ]; then
                domain+="${parts[i]}."
            else
                domain="${parts[i]}."
            fi
        done
        domain="${domain%.}"
    fi
    
    echo "Subdomain: $subdomain"
    echo "Prefix: $prefix"
    echo "Domain: $domain"
}

# Check if an argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain_or_subdomain>"
    exit 1
fi

# Call the splitDomain function with the provided domain/subdomain
splitDomain "$1"



# Function to make curl requests and output the first line of response
curlCall() {
    local url="$1"
    for method in "${METHODS[@]}"; do
        response=$(curl -Is -k -X "$method" "https://$url" | head -n 1)
        echo "[ Url: $url ] : : $method - Code: $response"
    done
}

# Check if an argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <target_url>"
    exit 1
fi

# Call the curlCall function with the provided target URL
curlCall "$1"
curlCall "www.$1"




