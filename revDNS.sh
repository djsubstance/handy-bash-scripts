# Reverse DNS Scan a /24 in bash

#!/bin/bash

# Define the IP range to scan
ip_range="18.238.4."

# Define ANSI escape codes for colors
cyan='\033[0;36m'
red='\033[0;31m'
reset='\033[0m'

# Function to perform reverse DNS lookup
reverse_dns_lookup() {
    ip=$1
    reverse_dns=$(host $ip | awk '{gsub(/\.$/,""); print $5}')
    echo -e "IP: ${cyan}$ip${reset}, Reverse DNS: ${red}$reverse_dns${reset}"
}

# Exporting the function for use with parallel
export -f reverse_dns_lookup

# Loop through the IP range and launch parallel threads
seq 0 255 | parallel -j 5 reverse_dns_lookup ${ip_range}{}



# --------- Example 
# Set the IP Range (3 octets) manually - ip_range="18.238.4."
# run script
./ss.sh | head -n 20
IP: 18.238.4.0, Reverse DNS: server-18-238-4-0.phl51.r.cloudfront.net
IP: 18.238.4.2, Reverse DNS: server-18-238-4-2.phl51.r.cloudfront.net
IP: 18.238.4.1, Reverse DNS: server-18-238-4-1.phl51.r.cloudfront.net
IP: 18.238.4.3, Reverse DNS: server-18-238-4-3.phl51.r.cloudfront.net
IP: 18.238.4.4, Reverse DNS: server-18-238-4-4.phl51.r.cloudfront.net
IP: 18.238.4.5, Reverse DNS: server-18-238-4-5.phl51.r.cloudfront.net
IP: 18.238.4.7, Reverse DNS: server-18-238-4-7.phl51.r.cloudfront.net
IP: 18.238.4.6, Reverse DNS: server-18-238-4-6.phl51.r.cloudfront.net
IP: 18.238.4.9, Reverse DNS: server-18-238-4-9.phl51.r.cloudfront.net
IP: 18.238.4.8, Reverse DNS: server-18-238-4-8.phl51.r.cloudfront.net
IP: 18.238.4.10, Reverse DNS: server-18-238-4-10.phl51.r.cloudfront.net
IP: 18.238.4.11, Reverse DNS: server-18-238-4-11.phl51.r.cloudfront.net
IP: 18.238.4.12, Reverse DNS: server-18-238-4-12.phl51.r.cloudfront.net
IP: 18.238.4.13, Reverse DNS: server-18-238-4-13.phl51.r.cloudfront.net
IP: 18.238.4.14, Reverse DNS: server-18-238-4-14.phl51.r.cloudfront.net
IP: 18.238.4.15, Reverse DNS: server-18-238-4-15.phl51.r.cloudfront.net
IP: 18.238.4.16, Reverse DNS: server-18-238-4-16.phl51.r.cloudfront.net
IP: 18.238.4.17, Reverse DNS: server-18-238-4-17.phl51.r.cloudfront.net
IP: 18.238.4.18, Reverse DNS: server-18-238-4-18.phl51.r.cloudfront.net
IP: 18.238.4.19, Reverse DNS: server-18-238-4-19.phl51.r.cloudfront.net


# Easily changable to a more interesting range:
./ss.sh | head -n 20
IP: 216.120.255.0, Reverse DNS: 3(NXDOMAIN)
IP: 216.120.255.1, Reverse DNS: nycp-sw-hr3550-1.hrnoc.net
IP: 216.120.255.2, Reverse DNS: HR-SW2950-13.hrnoc.net
IP: 216.120.255.3, Reverse DNS: colo-access-1.dbnoc.net
colo-access-1.hrnoc.net
dsw26.hrnoc.net
IP: 216.120.255.4, Reverse DNS: zeus.hrwebservices.net
IP: 216.120.255.6, Reverse DNS: smcnd.org
IP: 216.120.255.5, Reverse DNS: host.honorsquad.com
IP: 216.120.255.9, Reverse DNS: mailhost19.hostrocket.com
IP: 216.120.255.8, Reverse DNS: server.homeorgserv.net
IP: 216.120.255.7, Reverse DNS: Unassigned-216.120.255.7.hrwebservices.net
IP: 216.120.255.11, Reverse DNS: server1.biotrackthc-illinois.com
IP: 216.120.255.12, Reverse DNS: virt12.hrnoc.net
IP: 216.120.255.13, Reverse DNS: nasrepo.originsofmalu.com
IP: 216.120.255.10, Reverse DNS: zeus.hrwebservices.net
IP: 216.120.255.16, Reverse DNS: server1.twinzapp.com
IP: 216.120.255.15, Reverse DNS: dalgarno.silkwebdesign.ie
IP: 216.120.255.17, Reverse DNS: Unassigned-216.120.255.17.hrwebservices.net
IP: 216.120.255.14, Reverse DNS: record


# quite handy
