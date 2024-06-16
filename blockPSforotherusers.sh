as root


#!/bin/bash

# Ensure the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit 1
fi

# Backup current /etc/fstab
cp /etc/fstab /etc/fstab.bak

# Add the hidepid option to /proc mount
echo "Modifying /etc/fstab to add hidepid=2 to /proc mount options..."
if grep -q "^proc /proc proc" /etc/fstab; then
  sed -i '/^proc \/proc proc/s/defaults/defaults,hidepid=2/' /etc/fstab
else
  echo "proc /proc proc defaults,hidepid=2 0 0" >> /etc/fstab
fi

# Remount /proc with new options
echo "Remounting /proc with hidepid=2..."
mount -o remount /proc

echo "Configuration updated. Users can now only see their own processes."

# Print the current mount options for /proc to verify
mount | grep proc

exit 0
