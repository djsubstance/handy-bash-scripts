Filename: MatchRFC1918_IPs_bash_regex.sh
Created: 04/21/2024
Last Mod: 04/21/024
substance

function find_private_ips() {
    grep -oE '\b(10\.([0-9]{1,3}\.){2}[0-9]{1,3}|172\.(1[6-9]|2[0-9]|3[0-1])\.([0-9]{1,3}\.){2}[0-9]{1,3}|192\.168\.([0-9]{1,3}\.){2}[0-9]{1,3})\b' "$@"
}


or better yet, this was giving me problems in BSD and Darwin, so:

cat *.log |   grep -oE '\b(10\.([0-9]{1,3}\.){2}[0-9]{1,3}|172\.(1[6-9]|2[0-9]|3[0-1])\.([0-9]{1,3}\.){2}[0-9]{1,3}|192\.168\.([0-9]{1,3}\.){2}[0-9]{1,3})\b' 

Example output:
---------------
10.11.12.13
10.11.12.13
10.4.255.0
10.80.00.005
10.4.255.0
10.80.00.005
10.11.12.13
10.11.12.13
10.0.0.1
10.0.0.2
10.0.0.1


Whatever works for you this is a solid regex for RFC1918 ips.
