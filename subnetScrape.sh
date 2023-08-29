#!/bin/bash
# Filenane: subnetScrape.sh
# Purpose: run (with ./subnetScrape x.x.x. or 204.185.1.)

# Function to display a progress bar
function show_progress_bar() {
    local width=50
    local percentage=$1
    local filled=$(($percentage * $width / 100))
    local empty=$(($width - $filled))
    local progress_bar="["
    for ((i = 0; i < filled; i++)); do
        progress_bar+="*"
    done
    for ((i = 0; i < empty; i++)); do
        progress_bar+=" "
    done
    progress_bar+="]"

    printf "\r$progress_bar %3d%% %s" $percentage "$1"
}

# Function to perform a reverse DNS lookup for the /24 subnet
function reverse_dns_lookup() {
    local subnet="$1"
    local total=256
    local count=0

    echo "IP ADDR      Hostname of Pointer"
    echo "--------------------------------"

    for i in $(seq 0 255); do
        ip_address="${subnet}${i}"
        reverse_dns=$(host "$ip_address")

        if grep -q "domain name pointer" <<< "$reverse_dns"; then
            ptr_record=$(awk '{print $NF}' <<< "$reverse_dns")
            printf "%-12s%s\n" "$ip_address" "$ptr_record"
        fi

        ((count++))
        percentage=$((count * 100 / total))
        show_progress_bar $percentage "$ip_address"
    done
}

if [ -z "$1" ]; then
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



echo 
#####################   eof ##################
#  EXAMPLE ouput of a running version:
:[~/sh]
[subz@pvehost]$ ./SS.sh  204.182.1.
Starting reverse DNS lookup for the subnet: 204.182.1. 
IP ADDR      Hostname of Pointer   # THIS IS REV DNS SCANNING 204.182.1.0/24 and only found 7 o so
--------------------------------
[*************************************             ]  75% 75204.182.1.194mail5.zotosintl.com.
mail5.zotos.com.
mail.siclegal.com.
[**************************************            ]  76% 76204.182.1.197mail3.zotosintl.com.
mail2.siclegal.com.
mail3.zotos.com.
[**************************************            ]  77% 77204.182.1.199mail4.zotos.com.
mail4.zotosintl.com.
[****************************************          ]  81% 81204.182.1.209email4.joico.com.
[*****************************************         ]  82% 82204.182.1.210email.joico.com.
email3.joico.com.
[**************************************************] 100% 100Reverse DNS lookup completed.
