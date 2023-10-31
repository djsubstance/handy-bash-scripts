#!/bin/bash

# filenane: domainHealth.sh
# Prereqs: apt install html2text 


echo "Evaluating: $1 domain for health"; sleep 1
curl -sL "https://www.dnsinspect.com/$1"| html2text | tee $1.txt
echo "data output in: $1.txt";echo


------ [EOF] - CHMOD It  ./domainHealth.sh <domain.com>




Output in $1.txt
<its long>
Evaluating: 9x.tc domain for health

 Toggle navigation
autosize]_width="32"_height="32"_alt="logo.png">_DNS_INSPECT
    * Home
    * Blog
    * About
    * Contact
****** Report for 9x.tc ******
[name                ]  Run Report »
Report created on: Tue, 18 Apr 2023 01:03:18 GMT
Share this report:    |  permalink
[Thumbnail_for_www.9x.tc]
 Parent  100
 NS      94
 SOA     100
 MX      100
 Mail    60
 Web     100
B
Parent
 NS Records at Parent Servers
We have successfully fetched domain's NS records from parent name server
(root5.zone.tc.).
Domain NS records:
    * heather.ns.cloudflare.com. TTL=86400 [NO GLUE4] [NO GLUE6]
    * newt.ns.cloudflare.com. TTL=86400 [NO GLUE4] [NO GLUE6]
 Missing Glue
Test ignored, name servers are located outside of current zone.
 Name Servers Have A Records
OK. Found A records for all name servers.
    * heather.ns.cloudflare.com. → 173.245.58.161, 108.162.192.161,
      172.64.32.161
    * newt.ns.cloudflare.com. → 172.64.33.212, 108.162.193.212, 173.245.59.212
To reach your name servers via IPv4 an A record is needed for each name server.
 Name Servers Have AAAA Records
OK. Found AAAA records for all name servers.
    * heather.ns.cloudflare.com. → 2803:f800:50::6ca2:c0a1, 2a06:98c1:50::ac40:
      20a1, 2606:4700:50::adf5:3aa1
    * newt.ns.cloudflare.com. → 2803:f800:50::6ca2:c1d4, 2606:4700:58::adf5:
      3bd4, 2a06:98c1:50::ac40:21d4
To reach your name servers via IPv6 an AAAA record is needed for each name
server.
NS
 NS Records
Your name servers returned 2 NS records:
    * heather.ns.cloudflare.com. TTL=86400 [NO GLUE4] [NO GLUE6]
    * newt.ns.cloudflare.com. TTL=86400 [NO GLUE4] [NO GLUE6]
 All Name Servers Responded
OK. All your name servers responded. We queried domain's records from all of
your name servers and we received them successfully.
 Glue Check
OK. No differences found. The glue provided by the parent name servers has to
match the data provided by the authoritative name servers.
 Allow Recursive Queries
OK. Domain name servers are not allowing recursive queries. On all name servers
which acts as caching name servers recursive queries should be restricted to
local networks. Having open DNS servers can lead to abuses such as cache
poisoning and DOS (denial of service) attacks. Cache poisoning attacks allows
under certain conditions to redirect legitimate web traffic, email and other
traffic to malicious hosts compromising security.
 Check Name Servers Count
OK. Domain has 2 name servers. Recommended number, between 2 and 7 name servers
(RFC 2182 recommends to have at least 3 authoritative name servers for
domains).
 Identical NS Records
OK. All your name servers reported identical NS records. Each name server
should return identical NS records.
 Check for Lame Name servers
OK. No lame name servers found. All of your name servers are configured to be
either master or slave for your domain.
 Check All IPs are Public
OK. No private IPs found. Name servers using private IPs can't be reached from
the Internet causing DNS delays.
 Name Servers Have A Records
OK. Found A records for each name servers.
    * heather.ns.cloudflare.com. → 173.245.58.161, 108.162.192.161,
      172.64.32.161
    * newt.ns.cloudflare.com. → 173.245.59.212, 108.162.193.212, 172.64.33.212
To reach your name servers via IPv4 an A record is needed for each name server.
 Name Servers Have AAAA Records
OK. Found AAAA records for all name servers.
    * heather.ns.cloudflare.com. → 2803:f800:50::6ca2:c0a1, 2a06:98c1:50::ac40:
      20a1, 2606:4700:50::adf5:3aa1
    * newt.ns.cloudflare.com. → 2803:f800:50::6ca2:c1d4, 2606:4700:58::adf5:
      3bd4, 2a06:98c1:50::ac40:21d4
To reach your name servers via IPv6 an AAAA record is needed for each name
server.
 Name Servers Have Valid Names
OK. All names are valid. Name server name should be a valid host name, no
partial name or IP address.
 Check for Stealth Name Servers
OK. No stealth name servers found. All name servers returned by domain name
servers should be listed at parent servers.
 Check for Missing Name Servers
OK. No missing name servers found. All name servers returned by the parent name
servers should have an NS record at your name servers.
 No CNAME in NS Records
OK. No CNAMEs found in NS records. RFC 2181, section 10.3 says that host name
must map directly to one or more address record (A or AAAA) and must not point
to any CNAME records. RFC 1034, section 3.6.2 says if a name appears in the
right-hand side of RR (Resource Record) it should not appear in the left-hand
name of CNAME RR, thus CNAME records should not be used with NS and MX records.
Despite this restrictions, there are many working configuration using CNAME
with NS and MX records.
 Allow TCP connections
OK. All name servers are allowing TCP connections. When response to a DNS query
exceeds 512 bytes, TCP is negotiated and used, all name servers should allow
TCP connections (port 53).
 Name Servers Distributed on Multiple Networks
OK. Name servers are dispersed on 6 different C class networks:
    * 108.162.192.0/24:
          o heather.ns.cloudflare.com.
    * 108.162.193.0/24:
          o newt.ns.cloudflare.com.
    * 172.64.32.0/24:
          o heather.ns.cloudflare.com.
    * 172.64.33.0/24:
          o newt.ns.cloudflare.com.
    * 173.245.58.0/24:
          o heather.ns.cloudflare.com.
    * 173.245.59.0/24:
          o newt.ns.cloudflare.com.
Name servers should be dispersed (topologically and geographically) across the
Internet to avoid risk of single point of failure (RFC 2182).
 Name Servers Distributed on Multiple ASNs
WARNING: All name servers are located in one Autonomous System:
    * AS13335:
          o heather.ns.cloudflare.com.
          o newt.ns.cloudflare.com.
Name servers should be dispersed (topologically and geographically) across the
Internet to avoid risk of single point of failure (RFC 2182).
 Name Servers Versions
WARNING: Name servers software versions are exposed:
    * 108.162.192.161: "2023.4.0"
    * 108.162.193.212: "2023.4.0"
    * 172.64.32.161: "2023.4.0"
    * 172.64.33.212: "2023.4.0"
    * 173.245.58.161: "2023.4.0"
    * 173.245.59.212: "2023.4.0"
    * 2606:4700:50::adf5:3aa1: "2023.4.0"
    * 2606:4700:58::adf5:3bd4: "2023.4.0"
    * 2803:f800:50::6ca2:c0a1: "2023.4.0"
    * 2803:f800:50::6ca2:c1d4: "2023.4.0"
    * 2a06:98c1:50::ac40:20a1: "2023.4.1"
    * 2a06:98c1:50::ac40:21d4: "2023.4.0"
Exposing name server's versions may be risky, when a new vulnerability is found
your name servers may be automatically exploited by script kiddies until you
patch the system. Learn_how_to_hide_version.
SOA
 Check SOA Record
Domain SOA Record:
    * Primary nameserver: heather.ns.cloudflare.com.
    * Hostmaster (e-mail): dns.cloudflare.com.
    * Serial: 2306804225
    * Refresh: 10000
    * Retry: 2400
    * Expire: 604800
    * Minimum TTL: 3600
 Name Servers Agreement on Serial Number
OK. All name servers (2) have the same serial number [2306804225]. Having
different serials on your name servers may show inconsistencies between name
servers configuration (multiple masters), or communication errors (ACL and
firewall issues).
 SOA Number Format
NOTICE: Although your serial is valid [2306804225], it's not using recommended
serial number format YYYYMMDDnn, where YYYY is four-digit year number, MM is
the month, DD is the day and nn is the sequence number in case zone file is
updated more than once per day.
 SOA Mname
OK. Primary name server is heather.ns.cloudflare.com. and is listed at the
parent name servers. The MNAME field defines the Primary Master name server for
the zone, this name server should be found in your NS records.
 SOA Rname
OK. Contact email for DNS problems is [email protected]. (dns.cloudflare.com.).
RNAME field defines an administrative email for your zone. RFC2142 recommends
using hostmaster e-mail for this purpose, but any valid e-mail address can be
used.
 SOA Refresh
OK. Refresh interval is 10000. Recommended values [1200 .. 43200] (20 min ...
12 hours). Refresh field from SOA record determines how quickly zone changes
are propagated from master to slave.
 SOA Retry
OK. Retry interval is 2400. Recommended values [120 .. 7200] (2 minutes .. 2
hours). Retry field from SOA record defines how often slave should retry
contacting master if connection to master failed during refresh.
 SOA Expire
OK. Expire interval is 604800. Recommended values [604800 .. 1209600] (1 week
... 2 weeks). Expiry defines zone expiration time in seconds after which slave
must re-validate zone file, if contacting master fails then slave will stop
responding to any queries.
 SOA Minimum TTL
OK. Minimum TTL value is 3600. Recommended values [3600 .. 86400] (1 hour ... 1
day). Minimum TTL was redefined in RFC 2308, now it defines the period of time
used by slaves to cache negative responses.
MX
 MX Records
Your name servers returned 2 MX records:
    * 10 spool.mail.gandi.net. TTL=300
    * 50 fb.mail.gandi.net. TTL=300
 Identical MX Records
OK. All name servers returned identical MX records.
 Mail Servers Have A Records
OK. Found A records for all mail servers.
    * fb.mail.gandi.net. → 217.70.178.215, 217.70.178.216, 217.70.178.217
    * spool.mail.gandi.net. → 217.70.178.1
To reach your mail servers via IPv4 an A record is needed for each mail server.
 Mail Servers Have AAAA Records
NOTICE: While reading domain NS records at parent mail servers, we found mail
servers without AAAA records.
    * fb.mail.gandi.net. → ?
    * spool.mail.gandi.net. → ?
To reach your mail servers via IPv6 an AAAA record is needed for each mail
server.
 Reverse Entries for MX records
OK. All mail servers have reverse DNS entries configured correctly.
 Server                IP             PTR (Reverse)          IPs
 spool.mail.gandi.net. 217.70.178.1   spool.mail.gandi.net.  217.70.178.1
 fb.mail.gandi.net.    217.70.178.215 spool6.mail.gandi.net. 217.70.178.215
 fb.mail.gandi.net.    217.70.178.216 spool7.mail.gandi.net. 217.70.178.216
 fb.mail.gandi.net.    217.70.178.217 spool8.mail.gandi.net. 217.70.178.217
All mail servers should have a reverse DNS (PTR) entry for each IP address (RFC
1912). Missing reverse DNS entries will make many mail servers to reject your
e-mails or mark them as SPAM.
All IP's reverse DNS entries should resolve back to IP address (IP → PTR → IP).
Many mail servers are configured to reject e-mails from IPs with inconsistent
reverse DNS configuration.
 Check MX Records for Invalid Chars
OK. No invalid characters found. Name field from MX records should be a valid
host name.
 Check MX Records IPs are Public
OK. No private IPs found. Mail servers using private IPs can't be reached from
the Internet causing mail delivery delays.
 Check MX Records for Duplicates
OK. No MX records duplicates (same IP addresses) found. Although technically
valid, duplicate MX records have no benefits and can cause confusion.
 Only Host Names in MX Records
OK. No IPs found in MX records. IP addresses are not allowed in MX records,
only host names.
 No CNAME in MX Records
OK. No CNAMEs found in MX records. RFC 2181, section 10.3 says that host name
must map directly to one or more address record (A or AAAA) and must not point
to any CNAME records. RFC 1034, section 3.6.2 says if a name appears in the
right-hand side of RR (Resource Record) it should not appear in the left-hand
name of CNAME RR, thus CNAME records should not be used with NS and MX records.
Despite this restrictions, there are many working configuration using CNAME
with NS and MX records.
 RBL Check
OK. Mail servers IPs are not blacklisted.
 Check Google Apps Settings
Test ignored, domain is not using Google Apps.
Mail
 Connect to Mail Servers
FAIL: Connection to all mail servers failed.
    * fb.mail.gandi.net.: Server checks disabled due complaints.
    * spool.mail.gandi.net.: Server checks disabled due complaints.
To receive emails, mail servers should allow TCP connections on port 25.
 Mail Greeting
OK. No differences between mail server host names and greeting host name.
 Accepts Postmaster Address
Temporary error, could not determine if all mail servers are accepting emails
to [email protected] address:
    * fb.mail.gandi.net.
      Server checks disabled due complaints.
    * spool.mail.gandi.net.
      Server checks disabled due complaints.
RFC 822, RFC 1123 and RFC 2821 requires that all domain's mail servers should
accept e-mails to postmaster. To be compliant you can create an alias and
forward all postmaster's e-mails to a valid mailbox.
 Accepts Abuse Address
Temporary error, could not determine if all mail servers are accepting emails
to [email protected] address:
    * fb.mail.gandi.net.
      Server checks disabled due complaints.
    * spool.mail.gandi.net.
      Server checks disabled due complaints.
RFC 822, RFC 1123 and RFC 2821 requires that all domain's mail servers should
accept e-mails to postmaster. To be compliant you can create an alias and
forward all postmaster's e-mails to a valid mailbox.
 Check SPF record
OK. Found SPF record:
    * v=spf1 include:_mailcust.gandi.net ?all
SPF (Sender Policy Framework) record is designed to prevent e-mail spoofing.
Typical SPF record would be:
v=spf1 a mx ~all or v=spf1 a mx include:_spf.google.com ~all if you are using
Google Apps.
 Identical TXT records
OK. Name servers returned identical TXT records. Only SPF records are compared,
all name servers should return identical SPF records.
 Identical SPF records
No SPF type records found. All name servers should return identical SPF
records.
 Check DMARC record
NOTICE: Domain doesn't have DMARC record. DMARC (Domain-based Message
Authentication, Reporting & Conformance) helps reducing potential of email-
based abuse such as spam and phishing e-mails.
Web
 Resolve Domain Name
OK. Domain 9x.tc. resolves to:
    * 172.67.154.116
    * 104.21.5.100
 Domain Name IPs are Public
OK. No private IPs found for 9x.tc.. Web servers using private IPs can't be
reached from the Internet.
 Resolve WWW
OK. Domain www.9x.tc. resolves to:
    * 104.21.5.100
    * 172.67.154.116
 WWW IPs are Public
OK. No private IPs found for www.9x.tc.. Web servers using private IPs can't be reached from the Internet.
Report completed in 0.74 seconds.




