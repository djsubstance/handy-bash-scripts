# This script will grab all the DNS entries for the remote host, alot of times finding good stuff

#!/bin/bash

# Run dig command and store the output in a variable
dig_output=$(dig txt "$1" +short)

# Remove leading/trailing double quotes
txt_record="${dig_output%\"}"

echo $txt_record
txt_record="${txt_record#\"}"
echo $txt_record

# Replace quoted spaces with a delimiter
delimiter="|||"
txt_record="${txt_record//\" \"/$delimiter}"

echo $txt_record
# Split the record into individual parts
IFS="$delimiter" read -ra record_parts <<< "$txt_record"

# Print each part on a separate line
for part in "${record_parts[@]}"; do
    echo "$part"
done
echo
dig txt $1 | tail -n +10




[eof]
Example output:
./parse.sh  x.com
"google-site-verification=8yQmoVhQedzlt36RPeQP41ytrEFk9aHEnde_xm0626g" "kkdl3qb3tcrmdhfsm803p67r0my0svs8" "v=spf1 ip4:199.16.156.128/26 ip4:199.59.150.64/26 include:_spf.google.com -all
google-site-verification=8yQmoVhQedzlt36RPeQP41ytrEFk9aHEnde_xm0626g" "kkdl3qb3tcrmdhfsm803p67r0my0svs8" "v=spf1 ip4:199.16.156.128/26 ip4:199.59.150.64/26 include:_spf.google.com -all
google-site-verification=8yQmoVhQedzlt36RPeQP41ytrEFk9aHEnde_xm0626g" "kkdl3qb3tcrmdhfsm803p67r0my0svs8" "v=spf1 ip4:199.16.156.128/26 ip4:199.59.150.64/26 include:_spf.google.com -all
google-site-verification=8yQmoVhQedzlt36RPeQP41ytrEFk9aHEnde_xm0626g"

