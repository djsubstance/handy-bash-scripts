#!/bin/bash
# Filename: dnswatch.sh

echo "Pulling records for domain $1";echo
curl -sL "https://www.dnswatch.info/dns/dnslookup?la=en&host=$1&type=A&submit=Resolve" --user-agent 'mozlla' | html2text | grep ' A '
curl -sL "https://www.dnswatch.info/dns/dnslookup?la=en&host=$1&type=AAAA&submit=Resolve" --user-agent 'mozlla' | html2text | grep ' AAAA'
curl -sL "https://www.dnswatch.info/dns/dnslookup?la=en&host=$1&type=MX&submit=Resolve" --user-agent 'mozlla' | html2text | grep 'MX'
curl -sL "https://www.dnswatch.info/dns/dnslookup?la=en&host=$1&type=NS&submit=Resolve" --user-agent 'mozlla' | html2text | grep " NS "
curl -sL "https://www.dnswatch.info/dns/dnslookup?la=en&host=$1&type=SOA&submit=Resolve" --user-agent 'mozlla' | html2text | grep "SOA"
curl -sL "https://www.dnswatch.info/dns/dnslookup?la=en&host=$1&type=TXT&submit=Resolve" --user-agent 'mozlla' | html2text | grep "TXT"



Expected Output:
./dnswatch.sh cloudflare.net


cloudflare.net. A  300    104.17.156.85
cloudflare.net. A  300    104.16.208.90
Searching for cloudflare.net. AAAA record at I.ROOT-SERVERS.NET.
Searching for cloudflare.net. AAAA record at j.gtld-servers.net. [192.48.79.30]
Searching for cloudflare.net. AAAA record at ns5.cloudflare.net.
[One of: A/AAAA (IPv6)/MX/NS/SOA/TXT]
Searching for cloudflare.net. MX record at I.ROOT-SERVERS.NET. [192.36.148.17]
Searching for cloudflare.net. MX record at i.gtld-servers.net. [192.43.172.30]
Searching for cloudflare.net. MX record at ns2.cloudflare.net. [198.41.222.131]
MX record found: 10 mailstream-east.mxrecord.io.
MX record found: 10 mailstream-west.mxrecord.io.            [ Wrote 10 lines ]                                                             
MX record found: 20 mailstream-central.mxrecord.mx.
MX record found: 5 mailstream-canary.mxrecord.io.oogle.com -all"[198.41.223.31]efresh Retry Expire MinTTL
cloudflare.net. MX 300    10 mailstream-east.mxrecord.io.
cloudflare.net. MX 300    10 mailstream-west.mxrecord.io.
cloudflare.net. MX 300    20 mailstream-central.mxrecord.mx.
cloudflare.net. MX 300    5 mailstream-canary.mxrecord.io.
Searching for cloudflare.net. NS record at B.ROOT-SERVERS.NET. [192.228.79.201]
Searching for cloudflare.net. NS record at l.gtld-servers.net. [192.41.162.30]
Searching for cloudflare.net. NS record at ns4.cloudflare.net. [198.41.223.131]
cloudflare.net. NS 86400 ns1.cloudflare.net.
cloudflare.net. NS 86400 ns2.cloudflare.net.
cloudflare.net. NS 86400 ns3.cloudflare.net.
cloudflare.net. NS 86400 ns4.cloudflare.net.
cloudflare.net. NS 86400 ns5.cloudflare.net.
[One of: A/AAAA (IPv6)/MX/NS/SOA/TXT]
Searching for cloudflare.net. SOA record at I.ROOT-SERVERS.NET. [192.36.148.17]
Searching for cloudflare.net. SOA record at a.gtld-servers.net. [192.5.6.30]
Searching for cloudflare.net. SOA record at ns5.cloudflare.net. [198.41.223.31]
SOA record found: ns1.cloudflare.net. dns.cloudflare.com. 2324138674 10000 2400
cloudflare.net. SOA 1800   MName               RName               Serial No. Refresh Retry Expire MinTTL
[One of: A/AAAA (IPv6)/MX/NS/SOA/TXT]
Searching for cloudflare.net. TXT record at M.ROOT-SERVERS.NET. [202.12.27.33]
Searching for cloudflare.net. TXT record at i.gtld-servers.net. [192.43.172.30]
Searching for cloudflare.net. TXT record at ns2.cloudflare.net.
TXT record found: "v=spf1 include:_spf.google.com -all"
cloudflare.net. TXT 300    "v=spf1 include:_spf.google.com -all"
