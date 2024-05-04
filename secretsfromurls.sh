Created on 4/4/24
Last mod 4/4/24


This lil script will read from urls.txt and (at this point) try to match case insensiive the key words you have in the bash array at the top

#!/bin/bash

# Define an array of keywords
keywords=("API" "secret" "token" "bearer" "password" "-key" "eval\(")

# Read each URL from the file urls.txt
while IFS= read -r url; do
    # Use curl to fetch each URL and store the output
    response=$(curl -sL -A "Kona" -k -H "Origin: https://lab.pro?id=" "$url") # The header origin isnt necessary
    
    # Check each keyword in the response
    for keyword in "${keywords[@]}"; do
        # Use grep to search for the keyword in the response, case-insensitive
        echo "$response" | grep -i -n "$keyword" | while IFS= read -r line; do
            # Extract line number and text
            line_number=$(echo "$line" | cut -d':' -f1)
            matched_text=$(echo "$line" | cut -d':' -f2-)
            # Display the URL, line number, and the matched info
            echo "Match found in $url on line $line_number: $matched_text"
        done
    done
done < urls.txt

--- It needs work, im cleaning up the output ..
