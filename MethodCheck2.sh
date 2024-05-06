# Filename: MethodCheck2.sh
# Purpose: Check target first http:// then https://<domain as $1> for the various http methods looking for non 403 type reponses

#!/bin/bash

# Define HTTP methods and ANSI color codes
HTTPMethods=(GET POST PUT DELETE HEAD CONNECT OPTIONS TRACE PATCH TRACK PROPFIND PROPPATCH COPY MOVE LOCK UNLOCK MKCOL)
DARK_GREY="\033[1;30m"
BRIGHT_WHITE="\033[1;37m"
NC="\033[0m" # No Color

# Ensure the output directory exists
mkdir -p MethOut

# Function to display the list of HTTP methods
display_methods() {
    echo "Available HTTP Methods:"
    for method in "${HTTPMethods[@]}"; do
        echo "- $method"
    done
}

# Function to send requests using randomly selected HTTP methods and save cookies
StagePkt() {
    domain=$1
    domain_cleaned=$(echo "$domain" | sed 's/[^a-zA-Z0-9]/-/g')  # Clean domain name for use in filenames
    echo "Sending requests to $domain using randomly selected HTTP methods..."

    counter=0
    while true; do
        # Increment file counter properly
        while [[ -f "MethOut/${method}-${domain_cleaned}-cookie-jar-$counter.log" ]]; do
            ((counter++))
        done

        # Pick a random HTTP method
        method=${HTTPMethods[$RANDOM % ${#HTTPMethods[@]}]}
        echo "Using method: $method"

        # Perform a curl request, follow redirects, save the cookie jar
        response=$(curl -s -L -I -X $method -c "MethOut/${method}-${domain_cleaned}-cookie-jar-$counter.log" "$domain" -o response_headers.txt -w "%{http_code}")
        http_code=${response: -3}  # Extract status code from curl output

        # Print method, response code, and URL with color
        echo -e "${DARK_GREY}[${BRIGHT_WHITE}*${DARK_GREY}]${NC} Method: $method, Response: \"${http_code}\", Domain: $domain"

        # Wait for a bit before the next request (adjust timing as necessary)
        sleep 1
    done
}

# Main script logic
case "$1" in
    LIST)
        display_methods
        ;;
    HELP)
        echo "Usage:"
        echo "$0 [domain]  - Run the script with a domain to test HTTP methods."
        echo "$0 LIST      - Display the list of available HTTP methods."
        echo "$0 HELP      - Display this help message."
        ;;
    *)
        if [[ -n "$1" ]]; then
            StagePkt "$1"
        else
            echo "Error: No domain provided. Type '$0 HELP' for usage information."
        fi
        ;;
esac



Example output:
After chmod +x MethodCheck2.sh
./MethodCheck2.sh msn.com
sing method: PROPPATCH
[*] Method: PROPPATCH, Response: "405", Domain: msn.com
Using method: UNLOCK
[*] Method: UNLOCK, Response: "405", Domain: msn.com
Using method: COPY
[*] Method: COPY, Response: "405", Domain: msn.com
Using method: PUT
[*] Method: PUT, Response: "411", Domain: msn.com
Using method: TRACE
[*] Method: TRACE, Response: "405", Domain: msn.com
Using method: LOCK
[*] Method: LOCK, Response: "405", Domain: msn.com
Using method: HEAD
[*] Method: HEAD, Response: "404", Domain: msn.com
Using method: OPTIONS
sing method: POST
[*] Method: POST, Response: "411", Domain: msn.com
Using method: TRACE
[*] Method: TRACE, Response: "405", Domain: msn.com
Using method: GET
[*] Method: GET, Response: "200", Domain: msn.com
Using method: UNLOCK
[*] Method: UNLOCK, Response: "405", Domain: msn.com
Using method: GET
[*] Method: GET, Response: "200", Domain: msn.com
Using method: HEAD
[*] Method: HEAD, Response: "404", Domain: msn.com
Using method: PUT
[*] Method: PUT, Response: "411", Domain: msn.com
Using method: LOCK
[*] Method: LOCK, Response: "405", Domain: msn.com
Using method: DELETE
[*] Method: DELETE, Response: "405", Domain: msn.com
Using method: PATCH
[*] Method: PATCH, Response: "405", Domain: msn.com
Using method: UNLOCK
[*] Method: UNLOCK, Response: "405", Domain: msn.com
Using method: PUT
[*] Method: PUT, Response: "411", Domain: msn.com
Using method: GET
[*] Method: GET, Response: "200", Domain: msn.com
Using method: CONNECT
[*] Method: CONNECT, Response: "400", Domain: msn.com
Using method: POST
[*] Method: POST, Response: "411", Domain: msn.com
Using method: TRACE
[*] Method: TRACE, Response: "405", Domain: msn.com
Using method: PATCH
[*] Method: PATCH, Response: "405", Domain: msn.com
Using method: POST
[*] Method: POST, Response: "411", Domain: msn.com
Using method: TRACE
[*] Method: TRACE, Response: "405", Domain: msn.com
Using method: TRACK
[*] Method: TRACK, Response: "405", Domain: msn.com
Using method: PUT
[*] Method: PUT, Response: "411", Domain: msn.com

It should cycle thru http then https .  the best way of doing this is 
http://
https://
http://www.
https://www.

You can see .. things are starting to get interesting with the non 403 errors.  Look for those
