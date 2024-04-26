#!/bin/bash -x

# Path to the hosts.allow and hosts.deny files
hosts_allow="/etc/hosts.allow"
hosts_deny="/etc/hosts.deny"

# Backup the existing files
cp $hosts_allow "${hosts_allow}.bak"
cp $hosts_deny "${hosts_deny}.bak"

# Define an associative array to hold IP, Comment, and Log file name
declare -A ip_rules
ip_rules=(
    ["12.10."]="subz"
    ["54.211."]="y0h"
    ["10.3."]="MOO"
    ["10.4."]="MOO"
    ["172.100.111."]="me"
    ["6.207."]="me"
    ["14.28.12.135"]="me"
    ["10.8."]="subz"
    ["21.66."]="DAImeCE"
    ["10.8.40."]="4logvpn"
    ["10.8.2."]="2logvpn"
    ["10.8.1."]="1logvpn"
)

# Populate hosts.allow with dynamic entries
echo "" > $hosts_allow
for ip in "${!ip_rules[@]}"; do
    comment=${ip_rules[$ip]}
    echo "ALL: $ip : spawn /bin/echo \`date\` %c %d >> /var/log/allowed_ssh_${comment}.log" >> $hosts_allow
done

# Populate hosts.deny
cat > $hosts_deny << EOF
ALL:ALL : spawn /bin/echo \`date\` %c %d >> /var/log/ssh_FAIL_auth.log
EOF

echo "hosts.allow and hosts.deny have been updated."


