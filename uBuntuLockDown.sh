#
# uBuntuLockDown.sh
# Fetch the status of all services
# Author: substance
# Date: 12/31/23 / 4am
# ########################## [       Work in Progress        ] ###########################
# The goal of this work in progress (feel free to fork and add if you have ideas) is to basically take a 
# freetier/core ubunbu typical LAMP stack box and check the services, disable any unnecessary and check for
# apache2, making sure that ServerSignatures is off to not disclose version, etc.
# thats it for now
# see example output below

#!/bin/bash

mapfile -t services < <(service --status-all 2>&1)

# Initialize arrays for enabled and disabled services
enabled_services=()
disabled_services=()
services=(acpid console-setup.sh apparmor apport chrony cron irqbalance multipath-tools plymouth plymouth-log unattended-upgrades cryptdisks cryptdisks-early hibagent keyboard-setup.sh rsync screen-cleanup uuidd apache2 squid ntpd mysqld mariadb tor haproxy darkstat)

# Categorize services based on their status
for svc in "${services[@]}"; do
    if [[ $svc =~ \[\ \+\ \]\ (.*) ]]; then
        enabled_services+=("${BASH_REMATCH[1]}")
    elif [[ $svc =~ \[\ \-\ \]\ (.*) ]]; then
        disabled_services+=("${BASH_REMATCH[1]}")
    fi
done

# Function to display services side by side
display_services() {
    # Get terminal width
    local cols=$(tput cols)
    local mid=$((cols / 2))

    printf "%-${mid}s%-${mid}s\n" "Enabled Services:" "Disabled Services:"
    local max_lines=$((${#enabled_services[@]} > ${#disabled_services[@]} ? ${#enabled_services[@]} : ${#disabled_services[@]}))

    for ((i=0; i<max_lines; i++)); do
        printf "%-${mid}s%-${mid}s\n" "${enabled_services[i]:-}" "${disabled_services[i]:-}"
    done
}

# Display services
display_services

# Ask the user to disable non-critical services
echo "Do you want to disable any non-critical enabled services? (yes/no)"
read -r answer

to_disable=()
if [[ $answer == "yes" ]]; then
    echo "Enter the names of the services to disable, separated by spaces (e.g., 'mariadb apache2'): "
    read -ra services_to_disable

    for svc in "${services_to_disable[@]}"; do
        if [[ " ${enabled_services[@]} " =~ " $svc " ]]; then
            to_disable+=("$svc")
            sudo service "$svc" stop
            sudo update-rc.d "$svc" disable
            echo "$svc has been disabled."
        else
            echo "Service $svc is not enabled or not found."
        fi
    done
fi

# List services to be disabled
if [ ${#to_disable[@]} -ne 0 ]; then
    echo "Services disabled:"
    printf '%s\n' "${to_disable[@]}"
else
    echo "No services were disabled."
fi

# ------------- OUTPUT EXAMPLE FREETIER AWS  -------------- #

./lockdown.sh 
Enabled Services:                              Disabled Services:                             
Do you want to disable any non-critical enabled services? (yes/no)
YES
No services were disabled.
Enabled Services:
   acpid
   apache-htcacheclean
   apparmor
   apport
   chrony
   cron
   dbus
   kmod
   openvpn
   plymouth
   plymouth-log
   procps
   ssh
   ubuntu-fan
   udev
   ufw
   unattended-upgrades
   uuidd

Disabled Services:
   apache2
   console-setup.sh
   cryptdisks
   cryptdisks-early
   docker
   grub-common
   hibagent
   hwclock.sh
   irqbalance
   iscsid
   keyboard-setup.sh
   lvm2
   lvm2-lvmpolld
   open-iscsi
   open-vm-tools
   rsync
   screen-cleanup

 # Not only does the script stop the service, it stops it at boot with update-rc.d
 
