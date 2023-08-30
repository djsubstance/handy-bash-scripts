# Filename: ssScrape.sh
# purpose: another bash /24 scraper ansi 

#!/bin/bash

# ANSI color escape codes
RED='\033[0;31m'
LIGHT_CYAN='\033[1;36m'
BLUE='\033[0;34m'
LIGHT_BLUE='\033[1;34m'
RESET_COLOR='\033[0m'

# Function to display a colored progress bar
function show_progress_bar() {
    local width=50
    local percentage=$1
    local filled=$(($percentage * $width / 100))
    local empty=$(($width - $filled))
    local progress_bar="${LIGHT_CYAN}["
    for ((i = 0; i < filled; i++)); do
        progress_bar+="${RED}*"
    done
    for ((i = 0; i < empty; i++)); do
        progress_bar+=" "
    done
    progress_bar+="${LIGHT_CYAN}]${RESET_COLOR}"

    printf "\r${progress_bar} ${LIGHT_BLUE}%2d%%${RESET_COLOR} %s" $percentage "$1"
}

# Function to perform a reverse DNS lookup for the /24 subnet
function reverse_dns_lookup() {
    local subnet="$1"
    local total=256
    local count=0

    echo "IP ADDR      ${LIGHT_BLUE}Hostname of Pointer${RESET_COLOR}"
    echo "-------------------------------------"

    for i in $(seq 0 255); do
        ip_address="${subnet}${i}"
        reverse_dns=$(host "$ip_address")

        if grep -q "domain name pointer" <<< "$reverse_dns"; then
            ptr_record=$(awk '{print $NF}' <<< "$reverse_dns")
            printf "%-12s${LIGHT_BLUE}%s${RESET_COLOR}\n" " [::IP::] $ip_address" " [::PTR::] $ptr_record"
        fi

        ((count++))
        percentage=$((count * 100 / total))
        show_progress_bar $percentage "$ip_address"
    done
}

if [ -z "$1" ]; th
    echo "Usage: $0 <subnet>"
    exit 1
fi

# Check if $1 is a valid /24 subnet
if ! [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.$ ]]; then
    echo "Invalid subnet format. Please provide a valid /24 subnet (e.g., 192.168.1.)"
    exit 1
fi

echo "Starting reverse DNS lookup for the subnet: $1"

# Perform the reverse DNS lookup for the provided /24 subnet
reverse_dns_lookup "$1"

echo "Reverse DNS lookup completed."



-----
execute:
./ss.sh x.x.x.
