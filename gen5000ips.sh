# Filename: gen5000ips.sh
# Purpose: Generate some random ips ;p

#!/bin/bash
# Define the output file
output_file="ips.txt"
# Function to generate a random IP address
generate_random_ip() {
    echo "$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}
# Generate and sort 5000 random IP addresses
for ((i=0; i<5000; i++)); do
    generate_random_ip
done | sort -n -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4 > "$output_file"
echo "5000 random valid IPs generated and saved to $output_file"
#Save this script to a file (e.g., "generate_ips.sh") and make it executable by running:
#chmod +x generate_ips.sh
./generate_ips.sh
This script will generate 5000 random valid IP addresses and save them to the "ips.txt" file in ascending order. 
The `sort` command is used to sort the IP addresses numerically.
