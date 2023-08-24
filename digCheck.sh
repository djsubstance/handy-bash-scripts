Filename:  digCheck.sh
Purpose: Use bash to quickly (easilu dscriptable to handle bulk requests) to get the following info off target:
Checking mail servers for domain:
Checking SPF record for domain: 
Checking DMARC record for domain:
Non-authoritative answer:
Authoritative answers can be found from: (if available)

#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"

echo "Checking mail servers for domain: $domain"
echo "-------------------------------------"

# Retrieve mail server records
mx_records=$(nslookup -query=mx "$domain" | awk '/^Name:/ {print $2}')

if [ -z "$mx_records" ]; then
    echo "No mail servers found for $domain"
else
    echo "Mail Servers:"
    echo "$mx_records"
fi

# Check SPF record
spf_record=$(nslookup -type=txt "$domain" | grep "v=spf1" | awk '{$1=""; print $0}' | tr -d '"')

if [ -n "$spf_record" ]; then
    echo "SPF Record:"
    echo "$spf_record"
else
    echo "No SPF record found for $domain"
fi

# Check DMARC record
dmarc_record=$(nslookup -type=txt "_dmarc.$domain" | grep "v=DMARC1" | awk '{$1=""; print $0}' | tr -d '"')

if [ -n "$dmarc_record" ]; then
    echo "DMARC Record:"
    echo "$dmarc_record"
else
    echo "No DMARC record found for $domain"
fi

check_mail_servers() {
    local domain="$1"
    echo "Checking mail servers for domain: $domain"
    echo "-------------------------------------"
    
    mx_records=$(nslookup -query=mx "$domain" | awk '/^Name:/ {print $2}')
    
    if [ -z "$mx_records" ]; then
        echo "No mail servers found for $domain"
    else
        echo "Mail Servers:"
        echo "$mx_records"
    fi
}

check_spf_record() {
    local domain="$1"
    echo "Checking SPF record for domain: $domain"
    echo "-------------------------------------"
    
    spf_record=$(nslookup -type=txt "$domain" | grep "v=spf1" | awk '{$1=""; print $0}' | tr -d '"')
    
    if [ -n "$spf_record" ]; then
        echo "SPF Record:"
        echo "$spf_record"
    else
        echo "No SPF record found for $domain"
    fi
}

check_dmarc_record() {
    local domain="$1"
    echo "Checking DMARC record for domain: $domain"
    echo "-------------------------------------"
    
    dmarc_record=$(nslookup -type=txt "_dmarc.$domain" | grep "v=DMARC1" | awk '{$1=""; print $0}' | tr -d '"')
    
    if [ -n "$dmarc_record" ]; then
        echo "DMARC Record:"
        echo "$dmarc_record"
    else
        echo "No DMARC record found for $domain"
    fi
}

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"

check_with_nslookup() {
    local domain="$1"
    local tool="$2"
    
    if [ "$tool" == "mx" ]; then
        nslookup -query=mx "$domain"
    elif [ "$tool" == "txt" ]; then
        nslookup -type=txt "$domain"
    fi
}

check_with_dig() {
    local domain="$1"
    local tool="$2"
    
    if [ "$tool" == "mx" ]; then
        dig +short MX "$domain"
    elif [ "$tool" == "txt" ]; then
        dig +short TXT "$domain"
    fi
}

check_mail_servers() {
    local domain="$1"
    echo "Checking mail servers for domain: $domain"
    echo "-------------------------------------"

    mx_records=$(check_with_nslookup "$domain" "mx")
    if [ -z "$mx_records" ]; then
        mx_records=$(check_with_dig "$domain" "mx")
    fi

    if [ -z "$mx_records" ]; then
        echo "No mail servers found for $domain"
    else
        echo "Mail Servers:"
        echo "$mx_records"
    fi
}


if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"
check_mail_servers "$domain"
check_mail_servers "$domain"
echo
check_spf_record "$domain"
echo
check_dmarc_record "$domain"

echo


###################################################### 
# example output on x.com
#######
# chmod +x the scripot then run it with one arg (target domain)
 bash$ ./digchk.sh x.com

Checking mail servers for domain: x.com
-------------------------------------
No mail servers found for x.com
SPF Record:
 text = v=spf1 ip4:199.16.156.128/26 ip4:199.59.150.64/26 include:_spf.google.com -all
DMARC Record:
 text = v=DMARC1; p=none; rua=mailto:caf935f12c8645b2921b0749d1fcd49e@dmarc-reports.cloudflare.net
Checking mail servers for domain: x.com
-------------------------------------
No mail servers found for x.com

Checking SPF record for domain: x.com
-------------------------------------
SPF Record:
 text = v=spf1 ip4:199.16.156.128/26 ip4:199.59.150.64/26 include:_spf.google.com -all

Checking DMARC record for domain: x.com
-------------------------------------
DMARC Record:
 text = v=DMARC1; p=none; rua=mailto:caf935f12c8645b2921b0749d1fcd49e@dmarc-reports.cloudflare.net
Checking mail servers for domain: x.com
-------------------------------------
Mail Servers:
Server:		1.1.1.1
Address:	1.1.1.1#53

Non-authoritative answer:
x.com	mail exchanger = 1 aspmx.l.google.com.
x.com	mail exchanger = 10 alt3.aspmx.l.google.com.
x.com	mail exchanger = 10 alt4.aspmx.l.google.com.
x.com	mail exchanger = 5 alt1.aspmx.l.google.com.
x.com	mail exchanger = 5 alt2.aspmx.l.google.com.

Authoritative answers can be found from:


EOF

 
