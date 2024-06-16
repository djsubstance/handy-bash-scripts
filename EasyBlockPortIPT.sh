Create the following functions
to execute:  type: 

reject_traffic <port#> <optional interface>

If the packages arent available, they will install.

reject_traffic() {
    local port=$1
    local iface=${2:-$(ip route | grep default | awk '{print $5}')}

    if [[ -z "$port" ]]; then
        echo "Usage: reject_traffic <port> [interface]"
        return 1
    fi

    # Check and install necessary packages
    install_packages

    # Reject TCP traffic on the specified port
    sudo iptables -A INPUT -i "$iface" -p tcp --dport "$port" -j REJECT

    # Reject UDP traffic on the specified port
    sudo iptables -A INPUT -i "$iface" -p udp --dport "$port" -j REJECT

    # Save iptables rules
    if command -v netfilter-persistent &> /dev/null; then
        sudo netfilter-persistent save
    elif command -v iptables-save &> /dev/null && command -v iptables-restore &> /dev/null; then
        sudo iptables-save | sudo tee /etc/iptables/rules.v4
        create_systemd_service
    else
        echo "Error: Could not find a method to save iptables rules persistently."
        return 1
    fi

    echo "Traffic on port $port rejected on interface $iface."
}

# Function to check and install necessary packages
install_packages() {
    if ! command -v iptables &> /dev/null; then
        echo "iptables is not installed. Installing..."
        sudo apt-get update
        sudo apt-get install -y iptables
    fi

    if ! command -v netfilter-persistent &> /dev/null; then
        echo "netfilter-persistent is not installed. Installing..."
        sudo apt-get update
        sudo apt-get install -y iptables-persistent
    fi

    if ! command -v iptables-save &> /dev/null || ! command -v iptables-restore &> /dev/null; then
        echo "iptables-save and iptables-restore are not installed. Installing..."
        sudo apt-get update
        sudo apt-get install -y iptables
    fi
}

# Function to create a systemd service for iptables on systems using iptables-save and iptables-restore
create_systemd_service() {
    local service_file="/etc/systemd/system/iptables.service"

    sudo bash -c "cat > $service_file" <<EOL
[Unit]
Description=Load iptables rules
Before=network-pre.target
Wants=network-pre.target

[Service]
Type=oneshot
ExecStart=/sbin/iptables-restore < /etc/iptables/rules.v4
ExecReload=/sbin/iptables-restore < /etc/iptables/rules.v4
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOL

    sudo systemctl daemon-reload
    sudo systemctl enable iptables.service
}



