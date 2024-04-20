Populate the following in keywords.txt:
[root@XeninOSX]# cat keywords.txt 
password
secret
api_key
ConsumerKey
ConsumerSecret
DB_USERNAME
HEROKU_API_KEY
HOMEBREW_GITHUB_API_TOKEN
JEKYLL_GITHUB_TOKEN
PT_TOKEN
SESSION_TOKEN
SF_USERNAME
SLACK_BOT_TOKEN
access-token
access_token
access_token_secret
accesstoken
admin
api-key
api_key
api_secret_key
api_token
auth_token
authkey
authorization
authorization_key
authorization_token
authtoken
aws_access_key_id
aws_secret_access_key
bearer
bot_access_token
bucket
client-secret
client_id
client_key
client_secret
clientsecret
consumer_key
consumer_secret
dbpasswd
email
encryption-key
encryption_key
encryptionkey
id_dsa
irc_pass
key
oauth_token
pass
password
private_key
private-key
privatekey
secret
secret-key
secret_key
secret_token
secretkey
secretkey
session_key
session_secret
slack_api_token
slack_secret_token
slack_token
ssh-key
ssh_key
sshkey
token
username



Create secFW.sh:
---------------
secFW.sh 
#!/bin/bash

# Function to search keywords in the content of a given URL and log results
search_keywords_in_url() {
    local keywords_file="keywords.txt"
    local -a goldKW=() # Array to hold keywords
    local domain="$1"
    local url="https://$domain"
    local tempfile=$(mktemp)
    local js_dir="${domain}.data"
    local js_file="${js_dir}/scripts.txt"

    # ANSI colors via tput
    local red=$(tput setaf 1)
    local green=$(tput setaf 2)
    local yellow=$(tput setaf 3)
    local reset=$(tput sgr0)

    # Check if keywords file exists
    if [[ ! -f "$keywords_file" ]]; then
        echo "${red}Keywords file ($keywords_file) not found!${reset}"
        return 1
    fi

    # Ensure directory for .js files exists
    mkdir -p "$js_dir"
    > "$js_file" # Clear the JS file list before starting

    # Fetch content from URL
    curl -sL "$url" > "$tempfile"

    # Extract .js files and save to scripts.txt
    grep -oE '<script[^>]+src="([^"]+\.js)"' "$tempfile" | sed -E 's/.*src="([^"]+)".*/\1/' > "$js_file"
    echo "JavaScript files from ${yellow}$url${reset} saved to ${yellow}$js_file${reset}"

    # Read keywords into the array
    while IFS= read -r line; do
        goldKW+=("$line")
    done < "$keywords_file"

    echo "Searching in: ${yellow}$url${reset}"
    > out.log # Clear the log file before writing

    # Check each keyword in the fetched content
    for kw in "${goldKW[@]}"; do
        local count=$(grep -oic "$kw" "$tempfile")
        if [ "$count" -ne "0" ]; then
            echo "${green}Found keyword '${kw}' ${count} times in ${url}${reset}"
            echo "Found keyword '${kw}' ${count} times in ${url}" >> out.log
        fi
    done

    # Clean up
    rm "$tempfile"
}

# Main execution path
if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <domain-name>"
    exit 1
fi

search_keywords_in_url "$1"



----
chmod +x secFW.sh

/secFW.sh  www.msn.com
JavaScript files from https://www.msn.com saved to www.msn.com.data/scripts.txt
Searching in: https://www.msn.com
Found keyword 'access_token' 1 times in https://www.msn.com
Found keyword 'accesstoken' 1 times in https://www.msn.com
Found keyword 'admin' 1 times in https://www.msn.com
Found keyword 'authorization' 1 times in https://www.msn.com
Found keyword 'authtoken' 1 times in https://www.msn.com
Found keyword 'bearer' 1 times in https://www.msn.com
Found keyword 'client_id' 1 times in https://www.msn.com
Found keyword 'key' 3 times in https://www.msn.com
Found keyword 'pass' 1 times in https://www.msn.com
Found keyword 'token' 1 times in https://www.msn.com

