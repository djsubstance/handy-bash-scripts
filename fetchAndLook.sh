# Fetch and Look
# url="https://www.msnbc.com/robots.txt"
# usage ./fetchAndLook.sh "$url"

#!/bin/bash

# Standard (Not Bright) Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bright Colors
BRIGHT_BLACK='\033[0;90m'
BRIGHT_RED='\033[0;91m'
BRIGHT_GREEN='\033[0;92m'
BRIGHT_YELLOW='\033[0;93m'
BRIGHT_BLUE='\033[0;94m'
BRIGHT_PURPLE='\033[0;95m'
BRIGHT_CYAN='\033[0;96m'
BRIGHT_WHITE='\033[0;97m'

# No Color (Reset)
NC='\033[0m' # No Color


# Check if a URL was provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

# Initial URL
url=$1

# Function to fetch information with verbose output and extract relevant data
function fetch_info {
    echo "Following redirects for: $url"
    echo "----------------------------------"
    
    # Use curl with verbose output, and grep for location headers and final effective URL
    echo -e "${BRIGHT_BLUE}Curling: ${BRIGHT_CYAN}$url"
    curl -L -v --user-agent 'mozilla' -k --connect-timeout 3 -I "$url" 2>&1 | grep -E '(> GET|> Host:|< HTTP|< Location:|> Connection:|> Transfer)'
}

# Fetch information
fetch_info "$url"

#EOF



------------   EXAMPLE OUTPUT
# Set $url in bash
./fetch2.sh "$url"


Following redirects for: http://chat.openai.com/g/g-q7LckfakR
----------------------------------
Curling: http://chat.openai.com/g/g-q7LckfakR
> Host: chat.openai.com
< HTTP/1.1 301 Moved Permanently
< Location: https://chat.openai.com/g/g-q7LckfakR
> Host: chat.openai.com
< HTTP/2 308
> Host: chat.openai.com
< HTTP/2 200
