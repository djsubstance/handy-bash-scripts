Filename: chkVPNsvcs.sh
Author: substance
Created on: 4/17/24
Last Mod: 4/17/24
Purpose: Bash script to check two (2) ports one for SSH running on VPN one for squid running (easily changable)

Script:
Note: Modify the ip_base to your VPN network


#/bin/bash

start_ip=1
end_ip=15
ip_base="10.10.1."
ports=(3128 22)  # Array of ports to check

for i in $(seq $start_ip $end_ip); do
    for port in "${ports[@]}"; do
        ip="${ip_base}${i}"
        echo -ne "\n\n" | nc -w 1 $ip $port > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            if [ $port -eq 22 ]; then
                # Use /dev/tcp to connect and grab the SSH banner
                exec 3<>/dev/tcp/$ip/$port
                read -t 2 banner <&3  # Read banner with a timeout of 2 seconds
                echo "$ip:$port - Service is running. Banner: $banner"
                exec 3<&-  # Close the file descriptor
            elif [ $port -eq 3128 ]; then
                # Attempt to send an HTTP request and get a response from Squid
                exec 3<>/dev/tcp/$ip/$port
                echo -e "GET / HTTP/1.1\r\nHost: $ip\r\n\r\n" >&3
                head -n 1 <&3 > response.txt  # Read only the first line of the response
                read -t 2 response < response.txt
                if [[ $response =~ HTTP/[0-9.]+\s+[0-9]{3} ]]; then
                    echo "$ip:$port - Squid is running or similar HTTP service detected. HTTP Response: $response"
                else
                    echo "$ip:$port - Port open / Detected Squid : Response: $response"
                fi
                exec 3<&-  # Close the file descriptor
            else
                echo "$ip:$port - Service is running."
            fi
        else
           lastip=255
            #echo "$ip:$port - Service is not running."
        fi
    done
done

------ Example output:

10.10.1.1:3128 - Port open / Detected Squid : Response: HTTP/1.1 400 Bad Request
10.10.1.1:22 - Service is running. Banner: SSH-2.0-OpenSSH_9.3p1 Ubuntu-1ubuntu3.2
10.10.1.2:3128 - Port open / Detected Squid : Response: HTTP/1.1 400 Bad Request
10.10.1.2:22 - Service is running. Banner: SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.6
10.10.1.3:3128 - Port open / Detected Squid : Response: HTTP/1.1 400 Bad Request
10.10.1.3:22 - Service is running. Banner: SSH-2.0-OpenSSH_9.3p1 Ubuntu-1ubuntu3.2
10.10.1.5:3128 - Port open / Detected Squid : Response: HTTP/1.1 400 Bad Request
10.10.1.5:22 - Service is running. Banner: SSH-2.0-OpenSSH_9.3p1 Ubuntu-1ubuntu3.2
10.10.1.7:3128 - Port open / Detected Squid : Response: HTTP/1.1 400 Bad Request
10.10.1.7:22 - Service is running. Banner: SSH-2.0-OpenSSH_8.4p1 Debian-5+deb11u3
10.10.1.9:22 - Service is running. Banner: 
10.10.1.10:3128 - Port open / Detected Squid : Response: HTTP/1.1 400 Bad Request
10.10.1.10:22 - Service is running. Banner: SSH-2.0-OpenSSH_9.3p1 Ubuntu-1ubuntu3.2
10.10.1.13:22 - Service is running. Banner: SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.6

--- Note: 
Since I run squid sometimes on port 22, due to Oracle cloud confusion and complexity, this script comes in handy
I made a version that will run in parallel if you wanna mess with that:



Modified version same deal, usingh bash 'parallel' 3 at once:
filename: chkparallel.sh


#!/bin/bash

start_ip=1
end_ip=15
ip_base="10.10.1."
ports=(3128 22)  # Array of ports to check

export ip_base ports  # Export these variables to make them available in the parallel subshell

check_service() {
    ip="${ip_base}${1}"
    port="${2}"
    echo -ne "\n\n" | nc -w 1 $ip $port > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        if [ $port -eq 22 ]; then
            exec 3<>/dev/tcp/$ip/$port
            read -t 2 banner <&3
            echo "$ip:$port - Service is running. Banner: $banner"
            exec 3<&-
        elif [ $port -eq 3128 ]; then
            exec 3<>/dev/tcp/$ip/$port
            echo -e "GET / HTTP/1.1\r\nHost: $ip\r\n\r\n" >&3
            head -n 1 <&3 > response.txt
            read -t 2 response < response.txt
            if [[ $response =~ HTTP/[0-9.]+\s+[0-9]{3} ]]; then
                echo "$ip:$port - Squid is running or similar HTTP service detected. HTTP Response: $response"
            else
                echo "$ip:$port - Port open but not identified as Squid or similar HTTP service. Response: $response"
            fi
            exec 3<&-
        else
            echo "$ip:$port - Service is running."
        fi
    else
        echo "$ip:$port - Service is not running."
    fi
}

export -f check_service  # Export the function to make it available to parallel

# Use parallel to execute checks in batches of 3
parallel -j 3 --link check_service ::: $(seq $start_ip $end_ip) ::: ${ports[@]}


---- Note: the main difference is the output isnt in order 
10.10.1.2:22 - Service is running. Banner: SSH-2.0-OpenSSH_8.9p1 Ubuntu-3ubuntu0.6
10.10.1.4:22 - Service is not running.
10.10.1.1:3128 - Port open but not identified as Squid or similar HTTP service. Response: HTTP/1.1 400 Bad Request
10.10.1.3:3128 - Port open but not identified as Squid or similar HTTP service. Response: HTTP/1.1 400 Bad Request
10.10.1.5:3128 - Port open but not identified as Squid or similar HTTP service. Response: HTTP/1.1 400 Bad Request
10.10.1.6:22 - Service is not running.
10.10.1.9:3128 - Service is not running.
10.10.1.8:22 - Service is not running.
10.10.1.11:3128 - Service is not running.
10.10.1.10:22 - Service is running. Banner: SSH-2.0-OpenSSH_9.3p1 Ubuntu-1ubuntu3.2
10.10.1.13:3128 - Service is not running.
10.10.1.7:3128 - Port open but not identified as Squid or similar HTTP service. Response: HTTP/1.1 400 Bad Request
10.10.1.12:22 - Service is not running.
10.10.1.14:22 - Service is not running.
10.10.1.15:3128 - Service is not running.
10.10.1.16:22 - Service is not running.
10.10.1.17:3128 - Service is not running.
10.10.1.18:22 - Service is not running.
10.10.1.19:3128 - Service is not running.
10.10.1.22:22 - Service is not running.
10.10.1.20:22 - Service is not running.
10.10.1.21:3128 - Service is not running.
10.10.1.23:3128 - Service is not running.
10.10.1.24:22 - Service is not running.
10.10.1.25:3128 - Service is not running.

--- i recommend the former
