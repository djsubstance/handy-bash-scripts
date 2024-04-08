Filename: countLines2.sh
Desc: Count / Sort / Display the reptitive lines in a textfile or what is piped in
Notes: save file and chmod +x put in path
Usage: countLines2.sh ./urls.txt


#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File not found: $1"
    exit 1
fi
filename="$1"

awk '{
    count[$0]++  # Increment the count for the line
} 
END { 
    for (line in count) { 
        if (count[line] > 1) {  # Only consider duplicates
            print count[line] " - " line  # Print the count and the line
        }
    } 
}' "$filename" | sort -rn

----------------------------------------- Example output:
bash$ countLines2.sh ovpn.log | head 

COUNT - LINE OF REPTITION
2710  - read UDPv4 [ECONNREFUSED]: Connection refused (fd=6,code=111)
97    - read UDPv4 [ECONNREFUSED|ECONNREFUSED]: Connection refused (fd=6,code=111)
66    - DropIt/x.x.92.220:35312 peer info: IV_VER=2.6.5
66    - DropIt/x.x.92.220:35312 peer info: IV_TCPNL=1
66    - DropIt/x.x.92.220:35312 peer info: IV_PROTO=990
66    - DropIt/x.x.92.220:35312 peer info: IV_PLAT=linux
66    - DropIt/x.x.92.220:35312 peer info: IV_NCP=2
66    - DropIt/x.x.92.220:35312 peer info: IV_MTU=1600
66    - DropIt/x.x.92.220:35312 peer info: IV_LZO_STUB=1
66    - DropIt/x.x.92.220:35312 peer info: IV_COMP_STUBv2=1
------ As you can see this could come in handy, its not overly elite but I use it enough to put up here
substance
