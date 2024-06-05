Update - Check target for various HTTP methods report response:
update: 06/05/2024

#!/bin/bash

# Define URL variations using input domain
declare -a URLVariations

# Ensure a domain was provided
if [[ -z "$1" ]]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

# Fill array with URL variations
URLVariations=(
    "http://$1"
    "https://$1"
    "http://www.$1"
    "https://www.$1"
)

# Define HTTP methods to try
HTTPMethods=(GET HEAD POST PUT DELETE OPTIONS CONNECT TRACE TRACK MKCOL)

# Function to send requests and display results
try_methods() {
    local url=$1

    for method in "${HTTPMethods[@]}"; do
        # Send HTTP request with curl and extract the status code
        status_code=$(timeout 3 curl -o /dev/null -s -w "%{http_code}" -X "$method" "$url")
        
        # Display the method, URL, and status code
        echo "Method: $method, URL: $url, Status Code: $status_code"
    done
}

# Loop through all URL variations and try methods
for url in "${URLVariations[@]}"; do
    echo "Trying methods on $url"
    try_methods "$url"
    echo # Add a blank line for readability between different URLs
done


---------
Example: 
Trying methods on http://code.google.com
Method: GET, URL: http://code.google.com, Status Code: 200
Method: HEAD, URL: http://code.google.com, Status Code: 
Method: POST, URL: http://code.google.com, Status Code: 411
Method: PUT, URL: http://code.google.com, Status Code: 411
Method: DELETE, URL: http://code.google.com, Status Code: 200
Method: OPTIONS, URL: http://code.google.com, Status Code: 200
Method: CONNECT, URL: http://code.google.com, Status Code: 400
Method: TRACE, URL: http://code.google.com, Status Code: 405
Method: TRACK, URL: http://code.google.com, Status Code: 405
Method: MKCOL, URL: http://code.google.com, Status Code: 405

Trying methods on https://code.google.com
Method: GET, URL: https://code.google.com, Status Code: 200
Method: HEAD, URL: https://code.google.com, Status Code: 200
Method: POST, URL: https://code.google.com, Status Code: 404
Method: PUT, URL: https://code.google.com, Status Code: 200
Method: DELETE, URL: https://code.google.com, Status Code: 200
Method: OPTIONS, URL: https://code.google.com, Status Code: 200
Method: CONNECT, URL: https://code.google.com, Status Code: 400
Method: TRACE, URL: https://code.google.com, Status Code: 405
Method: TRACK, URL: https://code.google.com, Status Code: 405
Method: MKCOL, URL: https://code.google.com, Status Code: 405

Trying methods on http://www.code.google.com
Method: GET, URL: http://www.code.google.com, Status Code: 302
Method: HEAD, URL: http://www.code.google.com, Status Code: 
Method: POST, URL: http://www.code.google.com, Status Code: 411
Method: PUT, URL: http://www.code.google.com, Status Code: 411
Method: DELETE, URL: http://www.code.google.com, Status Code: 302
Method: OPTIONS, URL: http://www.code.google.com, Status Code: 302
Method: CONNECT, URL: http://www.code.google.com, Status Code: 400
Method: TRACE, URL: http://www.code.google.com, Status Code: 405
Method: TRACK, URL: http://www.code.google.com, Status Code: 405
Method: MKCOL, URL: http://www.code.google.com, Status Code: 405

Trying methods on https://www.code.google.com
Method: GET, URL: https://www.code.google.com, Status Code: 302
Method: HEAD, URL: https://www.code.google.com, Status Code: 302
Method: POST, URL: https://www.code.google.com, Status Code: 404
Method: PUT, URL: https://www.code.google.com, Status Code: 302
Method: DELETE, URL: https://www.code.google.com, Status Code: 302
Method: OPTIONS, URL: https://www.code.google.com, Status Code: 302
Method: CONNECT, URL: https://www.code.google.com, Status Code: 400
Method: TRACE, URL: https://www.code.google.com, Status Code: 405
Method: TRACK, URL: https://www.code.google.com, Status Code: 405
Method: MKCOL, URL: https://www.code.google.com, Status Code: 405

--------

Older ver:




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




