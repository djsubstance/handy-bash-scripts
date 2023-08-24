# Filename: revDNS_dos.sh
# 

#!/bin/bash
function show_spinner() {
# Define Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bold text colors
BOLD_BLACK='\033[1;30m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_YELLOW='\033[1;33m'
BOLD_BLUE='\033[1;34m'
BOLD_MAGENTA='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_WHITE='\033[1;37m'

# Reset color
RESET_COLOR='\033[0m'

    local delay=0.1
    local spinstr='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    local i=0

    while true; do
        printf "\r{$BOLD_CYAN}${spinstr:$i:1}"
        sleep $delay
        ((i = (i + 1) % ${#spinstr}))
    done
}

# Function to perform a reverse DNS lookup for the /24 subnet
function reverse_dns_lookup() {
    local subnet="$1"

    for i in $(seq 0 255); do
        ip_address="${subnet}${i}"
        reverse_dns=$(host "$ip_address")

        if grep -q "domain name pointer" <<< "$reverse_dns"; then
            echo "$ip_address: $reverse_dns"
        fi
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

echo "Starting the rev scan on $1..."
show_spinner &
spinner_pid=$!
reverse_dns_lookup "$1"
kill $spinner_pid
wait $spinner_pid 2>/dev/null   # Suppress the "Terminated" message
echo "reverse dns scan stopped."


 # Output Example: ((We want to reverse DNS scan 204.12.5.0/24)
 #############################################################################
 
 chmod +x ./revDNS_dos.sh
 bash$ ./revDNS_dos.sh  204.12.5.
 
Starting the rev scan on 204.12.5....
{}▒204.12.5.1: 1.5.12.204.in-addr.arpa domain name pointer williamsventurepartners.com.
{}▒204.12.5.2: 2.5.12.204.in-addr.arpa domain name pointer dateprize.com.
<snip>
{}▒204.12.5.40: 40.5.12.204.in-addr.arpa domain name pointer huntleychamber.org.
{}▒204.12.5.42: 42.5.12.204.in-addr.arpa domain name pointer egreencommerce.com.
{}▒204.12.5.43: 43.5.12.204.in-addr.arpa domain name pointer barromkt.com.
{}▒204.12.5.44: 44.5.12.204.in-addr.arpa domain name pointer empire-music.info.
{}▒204.12.5.45: 45.5.12.204.in-addr.arpa domain name pointer ifthenradio.com.
{}▒204.12.5.46: 46.5.12.204.in-addr.arpa domain name pointer realgoodness.com.
{}▒204.12.5.48: 48.5.12.204.in-addr.arpa domain name pointer sb360.lowndes-law.com.
{}▒204.12.5.49: 49.5.12.204.in-addr.arpa domain name pointer fundepartment.biz.
{}▒204.12.5.50: 50.5.12.204.in-addr.arpa domain name pointer cbvirtualbankruptcyservices.com.
{}▒204.12.5.51: 51.5.12.204.in-addr.arpa domain name pointer theforexmom.comtheforexmom.com.
{}▒204.12.5.52: 52.5.12.204.in-addr.arpa domain name pointer maxaguilerahellweg.com.
{}▒204.12.5.53: 53.5.12.204.in-addr.arpa domain name pointer schivaidscouncil.org.
{}▒204.12.5.54: 54.5.12.204.in-addr.arpa domain name pointer rehobothartandframing.com.
{}▒204.12.5.54: 54.5.12.204.in-addr.arpa domain name pointer rehobothartandframing.com.
<snip>
{}▒204.12.5.113: 113.5.12.204.in-addr.arpa domain name pointer rotaskipper.com.
{}▒204.12.5.114: 114.5.12.204.in-addr.arpa domain name pointer fashionjewelryandaccessories.com.
{}▒204.12.5.116: 116.5.12.204.in-addr.arpa domain name pointer facetsstore.com.
{}▒204.12.5.119: 119.5.12.204.in-addr.arpa domain name pointer trans-med.org.
{}▒204.12.5.121: 121.5.12.204.in-addr.arpa domain name pointer tommyhare.com.
{}▒204.12.5.122: 122.5.12.204.in-addr.arpa domain name pointer bimmercars.com.
{}▒204.12.5.125: 125.5.12.204.in-addr.arpa domain name pointer medisysqi.com.
{}▒204.12.5.130: 130.5.12.204.in-addr.arpa domain name pointer ge-0-0-17-0.cust3.nwk01.ntirety.com.
{}▒204.12.5.131: 131.5.12.204.in-addr.arpa domain name pointer ge-0-0-17-0.cust4.nwk01.ntirety.com.
{}▒204.12.5.141: 141.5.12.204.in-addr.arpa domain name pointer citycluster.ci.wilmington.de.us.
{}▒204.12.5.148: 148.5.12.204.in-addr.arpa domain name pointer nothing.safesecureweb.com.
{}▒204.12.5.166: 166.5.12.204.in-addr.arpa domain name pointer keithdmitchell.com.
{}▒204.12.5.172: 172.5.12.204.in-addr.arpa domain name pointer mail.fonthaus.com.
### NOTICE THE ACCURACY - NO RDNS IN THIS BLOCK
{}▒204.12.5.180: 180.5.12.204.in-addr.arpa domain name pointer mail.skybolt.net.
{}▒204.12.5.196: 196.5.12.204.in-addr.arpa domain name pointer email.yogaalliance.org.
{}▒204.12.5.212: 212.5.12.204.in-addr.arpa domain name pointer smtp.idistribution.net.
{}▒204.12.5.220: 220.5.12.204.in-addr.arpa domain name pointer ds50273-1.cyberwolf-software.com.
{}▒204.12.5.221: 221.5.12.204.in-addr.arpa domain name pointer ds50273-2.cyberwolf-software.com.
{}▒204.12.5.222: 222.5.12.204.in-addr.arpa domain name pointer ds50273-2.cyberwolf-software.com.
{}▒204.12.5.226: 226.5.12.204.in-addr.arpa domain name pointer ae0-2038.dist2.nwk01.ntirety.com.
{}▒204.12.5.227: 227.5.12.204.in-addr.arpa domain name pointer ae0-2038.dist1.nwk01.ntirety.com.
{}▒204.12.5.228: 228.5.12.204.in-addr.arpa domain name pointer relay2.wholesalepoint.com.
{}▒204.12.5.229: 229.5.12.204.in-addr.arpa domain name pointer wholesalepoint.com.
{}▒204.12.5.233: 233.5.12.204.in-addr.arpa domain name pointer amsorder.com.
{}▒204.12.5.235: 235.5.12.204.in-addr.arpa domain name pointer cosgrovesalesteam.com.
{}▒204.12.5.236: 236.5.12.204.in-addr.arpa domain name pointer amerimedsalesteam.com.
{}▒reverse dns scan stopped.


<snip>
