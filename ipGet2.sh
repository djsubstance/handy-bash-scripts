# Filename: ipGet2.sh
# OS's Supported - Most flavors of RedHat/Ubuntu as well verified on Darwin/OSX
# Outcome: uses a combo of piping thru awk and grep to identify
#  a) All interface names
#  b) IP address of each

#!/bin/bash
OS=$(uname -s)

# For macOS/Darwin
if [ "$OS" = "Darwin" ]; then
  
    interfaces=($(ifconfig | grep '^[a-z]' | awk '{print $1}' | tr -d ':'))

    for intf in "${interfaces[@]}"; do
        ip_and_mask=$(ifconfig $intf | grep 'inet ' | awk '{print $2, $4}')
        echo "$intf: $ip_and_mask"

    done
elif [ "$OS" = "Linux" ]; then
    # Linux commands
    interfaces=($(ip -o link show | awk -F': ' '{print $2}' | tr -d '@'))
    for intf in "${interfaces[@]}"; do
        ip_and_mask=$(ip -o -f inet addr show $intf | awk '{print $4}')
        echo "$intf: $ip_and_mask"
    done
else
    echo "Unsupported operating system."
fi
--- 
Ubuntu Example Output:

bash$ ./ipGet2.sh
 lo: 127.0.0.1/8
 eth0: 104.x.x.135/20
 eth1: 10.108.0.2/20
 docker0: 172.17.0.1/16
 tun0: 10.8.4.14/24


Darwin Example Output:
bash$ ./ipGet2.sh 
lo0: 127.0.0.1 0xff000000
gif0: 
stf0: 
en6: 
ap1: 
en0: 192.168.1.103 0xffffff00
awdl0: 
llw0: 
en3: 
en2: 
en4: 
en1: 
bridge0: 
utun0: 
utun1: 
utun2: 
utun3: 
utun4: 10.8.4.2 10.8.4.1

- As you can see making this work in Mac was a PIA but it works ;)





Verfied on Darwin (GNU bash, version 3.2.57(1)-release (x86_64-apple-darwin23))
Verified on Ubuntu 22 (GNU bash, version 5.2.15(1)-release (x86_64-pc-linux-gnu))

