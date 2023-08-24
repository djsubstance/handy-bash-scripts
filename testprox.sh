# filename: testprox.sh

#!/bin/sh
echo "using curl to test $1:$2 for a working socks5 proxy";echo
curl -sL -x socks5://$1:$2  http://ifconfig.co/json
echo

# You can get free proxies from proxypub.com - make a list of them in the format x.x.x.x <port> - use cat and xargs to read in the proxies to test them, they 
# should be socks5 proxies, run ./testprox.sh <ip> <port> - hit enter
# If the proxy works it will return json info about the IP of the proxy
