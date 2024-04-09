Filename: VerifyPortOpen.sh
Desc: Using bash (only) no netcat, or other tools, determine the status of a TCP port (open/closed)

Bash Script:
start_ip=1;end_ip=10;ip_base="10.8.4.";port=3128
for i in $(seq $start_ip $end_ip); do   ip="${ip_base}${i}";    echo -ne "\n\n" | timeout 3 nc -w 1 $ip $port > /dev/null 2>&1;    if [ $? -eq 0 ]; then     echo "$ip:$port - Squid is running.";   else     echo "$ip:$port - Squid is not running.";   fi; done

Usage:
In the example above, I am scanning to determine if Squid proxy is running on 3128 (on my VPN subnet 10.8.4.x) .  Scanning only 10 ips 1-10 (this can be changed)

Note: If 

Example output: (I like it better as a one liner, just dont forget to edit the port and ip range begin and end ip -
bash$ start_ip=1; end_ip=10; ip_base="10.8.4."; port=3128; for i in $(seq $start_ip $end_ip); do if timeout 3 nc -w 1 "${ip_base}${i}" $port > /dev/null 2>&1; then echo "${ip_base}${i}:$port - Squid is running."; else echo "${ip_base}${i}:$port - Squid is not running."; fi; done

10.8.4.1:3128 - Squid is running.
10.8.4.2:3128 - Squid is not running.
10.8.4.3:3128 - Squid is running.
10.8.4.4:3128 - Squid is not running.
10.8.4.5:3128 - Squid is running.
10.8.4.6:3128 - Squid is not running.
10.8.4.7:3128 - Squid is running.
10.8.4.8:3128 - Squid is not running.
10.8.4.9:3128 - Squid is not running.
10.8.4.10:3128 - Squid is running.


Till next time
- substance
