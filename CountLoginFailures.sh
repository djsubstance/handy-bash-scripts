Filename: CountLoginFailures.sh
#!/bin/bash

# Define the log file pattern
log_files="/var/log/*FAIL*.log"

# Check if any log files are found
if ls $log_files 1> /dev/null 2>&1; then
    echo "IPs sorted by occurrence:"
    echo "Count - IP Address"
    echo "-----------------"
    # Process log files
    cat $log_files |
    grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' | # Extract IPs using regex
    sort |                                   # Sort IPs to prepare for counting
    uniq -c |                                # Count occurrences of each IP
    sort -nr |                               # Sort numerically in reverse (most frequent first)
    awk '{print $1 " - " $2}'                # Format output as "Count - IP"
else
    echo "No log files found matching the pattern: $log_files"
fi

save / chmod +x run

Example:
IPs sorted by occurrence:
Count - IP Address
-----------------
1436 - x.109.202.127
572 - x.x.11.254
540 - x.x.11.27
522 - x.101.88.201
436 - x.169.175.35
429 - x.169.175.36
427 - x.133.151.219
427 - x.151.78.147
427 - x.161.52.71
