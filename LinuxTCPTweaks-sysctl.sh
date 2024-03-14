# Purpose: Checks to verify the most optimal TCP tweaks for your linux box are in place:
#!/bin/bash

# Deny users from seeing pid
echo "proc /proc proc defaults,hidepid=2 0 0" | sudo tee -a /etc/fstab > /dev/null && sudo mount -o remount /proc && echo "done"


CONFIG_FILE="/etc/sysctl.conf"
NEED_UPDATE=0

# Function to check if a setting exists in the configuration file
check_setting() {
    local setting="$1"
    grep -qE "^${setting}" "$CONFIG_FILE"
    return $?
}

# Function to update a setting in the configuration file
update_setting() {
    local setting="$1"
    local value="$2"
    if check_setting "$setting"; then
        # Setting exists, update it
        sed -i "s/^$setting=.*/$setting=$value/" "$CONFIG_FILE"
    else
        # Setting does not exist, append it
        echo "$setting=$value" >> "$CONFIG_FILE"
    fi
}

# Check each setting and mark for update if not set correctly
if ! check_setting "net.ipv4.ip_forward=1"; then
    NEED_UPDATE=1
fi
if ! check_setting "net.ipv4.conf.all.rp_filter=1"; then
    NEED_UPDATE=1
fi
if ! check_setting "net.ipv4.conf.default.rp_filter=1"; then
    NEED_UPDATE=1
fi

# Update the file if necessary
if [ $NEED_UPDATE -eq 1 ]; then
    echo "Modifying net.ipv4.ip_forward=1, net.ipv4.conf.all.rp_filter=1, net.ipv4.conf.default.rp_filter=1"
    update_setting "net.ipv4.ip_forward" "1"
    update_setting "net.ipv4.conf.all.rp_filter" "1"
    update_setting "net.ipv4.conf.default.rp_filter" "1"

    # Output to screen and run sysctl -p
    echo "Writing changes with sysctl -p"
    sysctl -p
else
    echo "No changes needed."
fi

[ ------------------ EXAMPLE USAGE --------------- ]
Put the above script into TCPtweaks.sh then cat TCPtweaks.sh | nc termbin.com 9999
After 5 seconds you should have a short URL.  You can use this to deploy this script 
and make sure routing is enabled etc.. like this:

 curl -sL https://termbin.com/<example>d7q | sudo -E bash -
 
