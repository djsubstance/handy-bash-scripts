#!/bin/bash

get_cookies() {
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
WHITE="\e[37m"

    if [ $# -ne 1 ]; then
        echo "Usage: get_cookies <website_domain>"
        echo "example: get_cookies www.msnbc.com"	
        exit 1
    fi

    website_domain="$1"
    response=$(curl -sI "https://${website_domain}")
    
    if [ $? -ne 0 ]; then
        echo "Error: Failed to retrieve website data."
        return 1
    fi
    
    cookies=$(echo "$response" | grep -i '^Set-Cookie:' | sed 's/^Set-Cookie: //i')
    
    if [ -z "$cookies" ]; then
        echo "No cookies found for $website_domain."
    else
        echo -e "$MAGENTA Cookies for $website_domain:";echo "-----------------------";
        while IFS= read -r line; do
            name=$(echo "$line" | cut -d '=' -f 1)
            value=$(echo "$line" | cut -d '=' -f 2-)
            echo -e "\e[91m$name\e[0m=\e[96m$value\e[0m";echo
        done <<< "$cookies"
    fi
}

# Usage example
#get_cookies www.msnbc.com;echo
echo "Checking $1";
get_cookies $1

################################
Example output if it worked :
 ./remCookie.sh  twitter.com

Checking twitter.com
-----------------------
guest_id_marketing=v1%3A169286608622093430; Max-Age=63072000; Expires=Sat, 23 Aug 2025 08:34:46 GMT; Path=/; Domain=.twitter.com; Secure; SameSite=None
guest_id_ads=v1%3A169286608622093430; Max-Age=63072000; Expires=Sat, 23 Aug 2025 08:34:46 GMT; Path=/; Domain=.twitter.com; Secure; SameSite=None
personalization_id="v1_5UlHbkIumUs8YH+XVMTuZw=="; Max-Age=63072000; Expires=Sat, 23 Aug 2025 08:34:46 GMT; Path=/; Domain=.twitter.com; Secure; SameSite=None
guest_id=v1%3A169286608622093430; Max-Age=63072000; Expires=Sat, 23 Aug 2025 08:34:46 GMT; Path=/; Domain=.twitter.com; Secure; SameSite=None


