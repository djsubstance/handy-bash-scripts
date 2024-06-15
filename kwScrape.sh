#!/bin/bash

# Function to search keywords in the content of a given URL and log results
search_keywords_in_url() {
    local keywords_file="keywords.txt"
    local -a goldKW=() # Array to hold keywords
    local domain="$1"
    local url="https://$domain"
    local tempfile=$(mktemp)

    # ANSI colors via tput
    local red=$(tput setaf 1)
    local green=$(tput setaf 2)
    local yellow=$(tput setaf 3)
    local reset=$(tput sgr0)

    # Check if keywords file exists
    if [[ ! -f "$keywords_file" ]]; then
        echo "${red}Keywords file ($keywords_file) not found!${reset}"
        return 1
    fi

    # Fetch content from URL
    curl -sL "$url" > "$tempfile"

    # Read keywords into the array
    while IFS= read -r line; do
        goldKW+=("$line")
    done < "$keywords_file"

    echo "Searching in: ${yellow}$url${reset}"
    > out.log # Clear the log file before writing

    # Check each keyword in the fetched content
    for kw in "${goldKW[@]}"; do
        local count=$(grep -oic "$kw" "$tempfile")
        if [ "$count" -ne "0" ]; then
            echo "${green}Found keyword '${kw}' ${count} times in ${url}${reset}"
            echo "Found keyword '${kw}' ${count} times in ${url}" >> out.log
        fi
    done

    # Clean up
    rm "$tempfile"
}

# Main execution path
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <domain-name>"
    exit 1
fi

search_keywords_in_url "$1"




 - just chmod +x kwScrape.sh
 ./kwScrape.sh <domain/webhost>
  ... You want to modify the keywords it looks to match on. but the defaults are good too

  Example:
  ./kwScrape.sh firebase.google.com
Searching in: https://firebase.google.com
Found keyword 'bucket' 2 times in https://firebase.google.com
Found keyword 'email' 1 times in https://firebase.google.com
Found keyword 'key' 2 times in https://firebase.google.com

---- Will update
