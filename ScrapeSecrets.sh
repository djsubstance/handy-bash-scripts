
 
[ --------------------------------------- FETCH API / AUTH / WEB ------------------------------------ ]

 ░▒▓███████▓▒░ ░▒▓████████▓▒░  ░▒▓██████▓▒░  ░▒▓███████▓▒░  ░▒▓████████▓▒░ ░▒▓████████▓▒░  ░▒▓███████▓▒░ 
░▒▓█▓▒░        ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░           ░▒▓█▓▒░     ░▒▓█▓▒░        
░▒▓█▓▒░        ░▒▓█▓▒░        ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░           ░▒▓█▓▒░     ░▒▓█▓▒░        
 ░▒▓██████▓▒░  ░▒▓██████▓▒░   ░▒▓█▓▒░        ░▒▓███████▓▒░  ░▒▓██████▓▒░      ░▒▓█▓▒░      ░▒▓██████▓▒░  
       ░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░           ░▒▓█▓▒░            ░▒▓█▓▒░ 
       ░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░           ░▒▓█▓▒░            ░▒▓█▓▒░ 
░▒▓███████▓▒░  ░▒▓████████▓▒░  ░▒▓██████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓████████▓▒░    ░▒▓█▓▒░     ░▒▓███████▓▒░  
                                                                                                         
[ --------------------------------------------------------------------------------------------------- ]

bash script - reads files in "urls.txt"   looks for isolated url opens / fetch with curl and grep for api/secret/auth

#!/bin/bash

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to print usage
print_usage() {
    echo -e "${GREEN}Usage: $0 -f <filename>${NC}"
}

# Check for the correct number of arguments
if [ "$#" -ne 2 ]; then
    print_usage
    exit 1
fi

# Parse command line options
while getopts 'f:' OPTION; do
    case "$OPTION" in
        f)
            filename="$OPTARG"
            ;;
        ?)
            print_usage
            exit 1
            ;;
    esac
done

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo -e "${RED}File does not exist: $filename${NC}"
    exit 1
fi

# Process each URL
while IFS= read -r line; do
    # Extract URL before the semicolon
    url="${line%;*}"
    echo -e "${GREEN}Fetching: ${url}${NC}"
    
    # Fetch content with a timeout, suppress errors
    content=$(curl -sLk --user-agent 'kona' --connect-timeout 5 "$url" 2>/dev/null)
    
    # Initialize a counter for found items
    found_counter=0
    
    # Check for keywords in content
    echo "$content" | grep -inE "api|secret|auth" | while read -r line_number line_content; do
        found_item=$(echo "$line_content" | grep -ioE "api|secret|auth" | sort -u)
        for item in $found_item; do
            echo -e "${RED}$found_counter- Found: $item - (LINE #$line_number) - $(echo $line_content | cut -c 1-50)${NC}"
            ((found_counter++))
        done
    done
    
    if [ $found_counter -eq 0 ]; then
        echo -e "${GREEN}No secrets found in: $url${NC}"
    fi
done < "$filename"

---------
Populate a file with urls:

urls.txt
-------
https://festivalfans.nl/;904947
https://www.autorenter.ru/;907250
https://com-org.biz/;907442
https://rybomania.by/;908246
https://techiestack.blogspot.com/;908956
https://erotic24.ro/;909157
https://kupalniki-nsk.ru/;909453
https://fairytalez.com/;909686
https://ru.elcorazon-shop.com/;910756
https://www.batestation.com/;913803
http://bennshine.com/;913986
https://branetheory.org/;914555
http://lynchnet.com/;922911
https://www.ohmymag.co.uk/;925017
https://www.therugshopuk.co.uk/;930173
https://elitepostel.ru/;935256
https://alfredosmondino.com/;943621
https://www.1800flowers.ca/;945103
(Any line with ; WILL ignore anything including the ; and to the right just isolating the URL)

execute:
chmod +x ScrapeSecrets.sh
./ScrapeSecrets.sh -f ./urls.txt

 --- Let it think
 Fetching: https://gfycat.com/
No secrets found in: https://gfycat.com/
Fetching: http://go.com/
0- Found: API - (LINE #18:) - <script data-nr-type="pro" data-nr-pct="10">(() =>
1- Found: api - (LINE #18:) - <script data-nr-type="pro" data-nr-pct="10">(() =>
2- Found: Auth - (LINE #44:) - <div id="matterhorn-fitt" class="style-pack-global
3- Found: Secret - (LINE #44:) - <div id="matterhorn-fitt" class="style-pack-global
4- Found: api - (LINE #44:) - <div id="matterhorn-fitt" class="style-pack-global
5- Found: auth - (LINE #44:) - <div id="matterhorn-fitt" class="style-pack-global
6- Found: secret - (LINE #44:) - <div id="matterhorn-fitt" class="style-pack-global
7- Found: Auth - (LINE #46:) - <script>window['__CONFIG__']={"uid":"matterhorn-fi
8- Found: Secret - (LINE #46:) - <script>window['__CONFIG__']={"uid":"matterhorn-fi
9- Found: api - (LINE #46:) - <script>window['__CONFIG__']={"uid":"matterhorn-fi
10- Found: auth - (LINE #46:) - <script>window['__CONFIG__']={"uid":"matterhorn-fi
11- Found: secret - (LINE #46:) - <script>window['__CONFIG__']={"uid":"matterhorn-fi
No secrets found in: http://go.com/
Fetching: https://ccm.net/
^CNo secrets found in: https://ccm.net/
Fetching: https://www.sbnation.com/
0- Found: Auth - (LINE #106:) - const initialDataLayer = {"Network":"sbnation","Co
1- Found: auth - (LINE #106:) - const initialDataLayer = {"Network":"sbnation","Co
2- Found: auth - (LINE #410:) - <a class="c-global-header__login-icon" href="https
3- Found: auth - (LINE #415:) - <a href="https://auth.voxmedia.com/login?community
4- Found: auth - (LINE #419:) - <a href="https://auth.voxmedia.com/signup?communit
5- Found: secret - (LINE #458:) - <li class="c-global-header__link " data-nav-item-i
6- Found: secret - (LINE #460:) - <a href="https://www.sbnation.com/secret-base">
7- Found: Secret - (LINE #461:) - Secret Base
8- Found: secret - (LINE #697:) - <li data-nav-item-id="secret-base">
^CNo secrets found in: https://www.sbnation.com/
Fetching: https://www.ted.com/

Note:
This is not magic or garunteed to help at all, this was just an after thought and has found some cool things for me

