

#!/bin/bash

# Function to get URLs from the Wayback Machine
get_wayback_urls() {
  # Check if an argument (URL) is provided
  if [ -z "$1" ]; then
    echo "Usage: get_wayback_urls \"URL\""
    return 1
  fi

  # Set the base API URL for the Wayback Machine with the input URL
  local api_url="https://web.archive.org/web/timemap/json?url=$1&matchType=prefix&collapse=urlkey&output=json&fl=original"

  # Use curl to fetch the data and jq to parse the JSON response and extract only the URLs
  curl -s "$api_url" \
    -H 'accept: application/json, text/javascript, */*; q=0.01' \
    -H 'user-agent: Mozilla/5.0 (compatible; Wayback-Crawler/1.0)' \
    --compressed | jq -r '.[1:][] | .[0]'
}

# Call the function with the provided URL argument
get_wayback_urls "$1"




Note: this may take a while
