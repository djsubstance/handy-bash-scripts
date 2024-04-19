Filename: Concurrent_Curls.sh


Script: 
2 Variables:
$1 - Domain (ie: drive.google.com)
$url = "https://drive.google.com/full/path/here.js"

#!/bin/bash

echo "Concurrently hitting: $1"; echo

# Initialize an array to store times
declare -a times

# Function to perform a curl request and measure the time
perform_request() {
    local START_TIME=$(date +%s%N) # Start time in nanoseconds
    local START_TIME_MS=$((START_TIME / 1000000)) # Convert nanoseconds to milliseconds

    curl --path-as-is -i -s -k -X $'GET' \
        -H "Host: $1" \
        -H $'Accept-Encoding: deflate' \
        -H $'Accept: */*' \
        -H $'Accept-Language: en-US;q=0.9,en;q=0.8' \
        -H $'User-Agent: Kona' \
        -H $'Connection: close' \
        -H $'Cache-Control: max-age=0' \
        -H $'Origin: https://xz340fksldusc15wrtqv8odagapn07z1.com' \
        -H $'Via: xz340fksldusc15wrtqv8odagapn07z1' \
        $"$url" > /dev/null

    local END_TIME=$(date +%s%N) # End time in nanoseconds
    local END_TIME_MS=$((END_TIME / 1000000)) # Convert nanoseconds to milliseconds
    local ELAPSED_TIME=$((END_TIME_MS - START_TIME_MS)) # Calculate elapsed time in milliseconds

    echo "$ELAPSED_TIME" >> times.txt
}

# Run ten parallel requests
for i in {1..10}; do
    perform_request &
done

wait # Wait for all background processes to finish

# Read times into an array
readarray -t times < times.txt
echo "Visited $url (10) times";
# Calculate min, max and average
MIN=$(printf "%s\n" "${times[@]}" | sort -n | head -n1)
MAX=$(printf "%s\n" "${times[@]}" | sort -n | tail -n1)
SUM=0
for t in "${times[@]}"; do
    let SUM+=t
done
AVG=$(echo "$SUM / ${#times[@]}" | bc)

echo "All requests completed."
echo "Min: $MIN ms, Avg: $AVG ms, Max: $MAX ms"

# Clean up
rm times.txt

