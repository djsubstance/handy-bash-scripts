
░▒▓█▓▒░░▒▓█▓▒ ░▒▓████████▓▒░░▒▓██████▓▒░ ░▒▓███████▓▒░ ░▒▓████████▓▒░▒▓███████▓▒░ ░▒▓████████▓▒░ 
░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒ ░      ░▒▓█▓▒░ 
░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒ ░    ░▒▓██▓▒░  
░▒▓████████▓▒ ░▒▓██████▓▒░ ░▒▓████████▓▒ ░▒▓█▓▒░░▒▓█▓▒ ░▒▓██████▓▒░ ░▒▓███████▓▒░     ░▒▓██▓▒░    
░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒ ░░▒▓██▓▒░      
░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░        
░▒▓█▓▒░░▒▓█▓▒ ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒ ░▒▓███████▓▒░ ░▒▓████████▓▒░▒▓█▓▒░░▒▓█▓▒ ░▒▓████████▓▒░ 
        
░▒▓███████▓▒░ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓███████▓▒░ 
░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░        
░▒▓█▓▒░░▒▓█▓▒ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ▒▓█▓▒░        
░▒▓███████▓▒░ ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓██████▓▒░  
░▒▓█▓▒░       ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░ 
░▒▓█▓▒░       ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░ 
░▒▓█▓▒░       ░▒▓████████▓▒ ░▒▓██████▓▒░ ░▒▓███████▓▒░  
                                                     [ headers+ v1.01]
                                                     
** A seriously MASSIVE amount of information on your target with one command **
Create file : headersPlus.sh in bash
Populate file with the following
chmod +x file
./headersPlus.sh www.tesla.com

---- Script
#!/bin/bash
echo "Checking $1"
echo
if [ $# -eq 0 ]; then
    echo "No arguments supplied. Exiting the script."
    exit 1
fi

# Define ANSI color codes
RED='\033[0;31m'
GREY='\033[1;30m'
NC='\033[0m' # No Color
fullUrl="https://$1";
echo $fullUrl
# Fetch the content using curl
content=$(curl -sLk --user-agent 'moz' --connect-timeout 3 "https://domain.glass/$fullUrl#http_headers" | html2text)

# Process each line of the output
echo "$content" | while read -r line; do
    # Extract the left and right parts of the URL
    left_part=$(echo "$line" | grep -o '^[^(]*')
    right_part=$(echo "$line" | grep -o '\(.*\)')

    # Print the left part in red, right part in grey, followed by a hyphen
    echo -e "${RED}$left_part${NC}${GREY}$right_part -${NC}"
done

##### Example output: HTTP_Headers Search_Results WHOIS DNS
Target: www.tesla.com

In addition to a TON of good info on the target:
* Top Subdomains on tesla.com *** - ./*** Top Subdomains on tesla.com *** -
Subdomain                                Cisco Umbrella DNS Rank Majestic Rank - ./Subdomain                                Cisco Umbrella DNS Rank Majestic Rank -
tesla.com                                73145                   878 - ./tesla.com                                73145                   878 -
epuca-prd.usw2.vn.cloud.tesla.com        56181                   - - ./epuca-prd.usw2.vn.cloud.tesla.com        56181                   - -
npuv-prd.usw2.vn.cloud.tesla.com         91408                   - - ./npuv-prd.usw2.vn.cloud.tesla.com         91408                   - -
www.tesla.com                            104201                  - - ./www.tesla.com                            104201                  - -
npute-prd.use1.vn.cloud.tesla.com        131403                  - - ./npute-prd.use1.vn.cloud.tesla.com        131403                  - -
hermes-ap.prd.vn.cloud.tesla.com         135688                  - - ./hermes-ap.prd.vn.cloud.tesla.com         135688                  - -
npute-prd.usw2.vn.cloud.tesla.com        142177                  - - ./npute-prd.usw2.vn.cloud.tesla.com        142177                  - -
sentry0.app.tesla.com                    159134                  - - ./sentry0.app.tesla.com                    159134                  - -
telemetry-ap.prd.vn.cloud.tesla.com      193532                  - - ./telemetry-ap.prd.vn.cloud.tesla.com      193532                  - -
epuca-prd.euw1.vn.cloud.tesla.com        207191                  - - ./epuca-prd.euw1.vn.cloud.tesla.com        207191                  - -
digitalassets-shop.tesla.com             207794                  - - ./digitalassets-shop.tesla.com             207794                  - -
location-services-prd.tesla.com          221024                  - - ./location-services-prd.tesla.com          221024                  - -
digitalassets-secure.tesla.com           226848                  - - ./digitalassets-secure.tesla.com           226848                  - -
analytics-relay.tesla.com                239919                  - - ./analytics-relay.tesla.com                239919                  - -
static-assets.tesla.com                  254461                  - - ./static-assets.tesla.com                  254461                  - -
fn.tesla.com                             279453                  - - ./fn.tesla.com                             279453                  - -
auth.tesla.com                           291298                  - - ./auth.tesla.com                           291298                  - -
npuapt-prd.use1.vn.cloud.tesla.com       293941                  - - ./npuapt-prd.use1.vn.cloud.tesla.com       293941                  - -
shamgr01.tesla.com                       311507                  - - ./shamgr01.tesla.com                       311507                  - -
qa-ecm.tesla.com                         314078                  - - ./qa-ecm.tesla.com                         314078                  - -
redeven.tesla.com                        314110                  - - ./redeven.tesla.com                        314110                  - -
static-assets-teslaaccount.tesla.com     316623                  - - ./static-assets-teslaaccount.tesla.com     316623                  - -
rockcorp.tesla.com                       316870                  - - ./rockcorp.tesla.com                       316870                  - -
sambaedu-clg-0951964u.tesla.com          319810                  - - ./sambaedu-clg-0951964u.tesla.com          319810                  - -
passwordshare.tesla.com                  321047                  - - ./passwordshare.tesla.com                  321047                  - -
qa-audi.tesla.com                        321112                  - - ./qa-audi.tesla.com                        321112                  - -
pai-fwope-p02.tesla.com                  322499                  - - ./pai-fwope-p02.tesla.com                  322499                  - -
phpmariaadmin.tesla.com                  322521                  - - ./phpmariaadmin.tesla.com                  322521                  - -
pinnaclehomessouth.tesla.com             322523                  - - ./pinnaclehomessouth.tesla.com             322523                  - -
polimiapp.tesla.com                      322533                  - - ./polimiapp.tesla.com                      322533                  - -
qmsvendor.tesla.com                      322576                  - - ./qmsvendor.tesla.com                      322576                  - -


Displays Traffic Ranks:
Platform   Rank - ./Platform   Rank -
Date - ./Date -
Alexa      1163 - ./Alexa      1163 -
Tranco     1385 - ./Tranco     1385 - 2020-11-24 - ./2020-11-24 -
Majestic   878 - ./Majestic   878 - 2023-12-24 - ./2023-12-24 -

Suggests possibly "interesting" files or paths:
suggestions:www.tesla.com www.tesla.com/teslaaccount www.tesla.com inventory - ./suggestions:www.tesla.com www.tesla.com/teslaaccount www.tesla.com inventory -
www.tesla.com/support/insurance www.tesla.com/wallconnector www.tesla.com/ - ./www.tesla.com/support/insurance www.tesla.com/wallconnector www.tesla.com/ -
support www.tesla.com used www.tesla.com careers www.tesla.com/tradein - ./support www.tesla.com used www.tesla.com careers www.tesla.com/tradein -
www.tesla.com/realestate mobile: tesla.com tesla.com.au - ./www.tesla.com/realestate mobile: tesla.com tesla.com.au -
[https://cdn2.smoot.apple.com/image?.sig=Z8Ol- - ./[https://cdn2.smoot.apple.com/image?.sig=Z8Ol- -
8AizCyoOq4n2Dke2Q%3D%3D&domain=web_index&image_url=http%3A%2F%2Ftesla.com%2Fns_videos%2Fmodel- - ./8AizCyoOq4n2Dke2Q%3D%3D&domain=web_index&image_url=http%3A%2F%2Ftesla.com%2Fns_videos%2Fmodel- -



The certificate: 
Signature Algorithm: sha256WithRSAEncryption - ./Signature Algorithm: sha256WithRSAEncryption -
56:e0:a2:20:89:67:77:fe:72:f3:25:19:b3:11:f8:7f:8f:2e: - ./56:e0:a2:20:89:67:77:fe:72:f3:25:19:b3:11:f8:7f:8f:2e: -
6f:72:33:38:6b:e9:e4:3b:35:50:02:c5:14:fb:d5:96:12:d6: - ./6f:72:33:38:6b:e9:e4:3b:35:50:02:c5:14:fb:d5:96:12:d6: -
68:ab:55:ac:5e:35:a4:43:fb:6f:5b:f9:52:41:55:85:f9:dd: - ./68:ab:55:ac:5e:35:a4:43:fb:6f:5b:f9:52:41:55:85:f9:dd: -
2f:fd:4d:74:19:03:c0:61:53:a0:7a:c5:c3:cc:05:34:4f:bb: - ./2f:fd:4d:74:19:03:c0:61:53:a0:7a:c5:c3:cc:05:34:4f:bb: -
da:0d:ae:41:72:c2:3e:63:2f:18:69:e3:d3:c6:63:1c:db:6d: - ./da:0d:ae:41:72:c2:3e:63:2f:18:69:e3:d3:c6:63:1c:db:6d: -
38:f7:70:ff:27:e6:97:b2:d3:40:3a:36:f9:ec:12:4d:ae:5a: - ./38:f7:70:ff:27:e6:97:b2:d3:40:3a:36:f9:ec:12:4d:ae:5a: -
0f:53:7f:a6:e4:f2:f4:b7:2b:9a:a4:91:af:d7:95:b0:02:33: - ./0f:53:7f:a6:e4:f2:f4:b7:2b:9a:a4:91:af:d7:95:b0:02:33: -
a0:ff:8f:af:87:3e:2c:02:f6:be:ec:3c:67:74:d6:4b:47:37: - ./a0:ff:8f:af:87:3e:2c:02:f6:be:ec:3c:67:74:d6:4b:47:37: -
20:1f:ca:4b:22:49:a4:43:95:d7:8b:e5:ec:e6:80:7a:e7:1b: - ./20:1f:ca:4b:22:49:a4:43:95:d7:8b:e5:ec:e6:80:7a:e7:1b: -
f9:8b:8c:92:22:20:e2:e2:d4:6e:ad:dd:4f:12:d8:17:95:02: - ./f9:8b:8c:92:22:20:e2:e2:d4:6e:ad:dd:4f:12:d8:17:95:02: -
fb:fe:28:d4:40:a3:87:ff:69:0c:27:8f:55:51:2d:33:60:d4: - ./fb:fe:28:d4:40:a3:87:ff:69:0c:27:8f:55:51:2d:33:60:d4: -
eb:ad:5d:c5:f9:89:d2:9f:a2:db:84:a4:72:65:34:12:8e:f2: - ./eb:ad:5d:c5:f9:89:d2:9f:a2:db:84:a4:72:65:34:12:8e:f2: -
f8:17:2e:85:ba:bd:31:73:b0:1b:e3:6e:14:f7:f3:21:31:63: - ./f8:17:2e:85:ba:bd:31:73:b0:1b:e3:6e:14:f7:f3:21:31:63: -
eb:e5:79:3e:4e:a1:bc:12:39:8b:80:76:cc:3e:a9:10:60:83: - ./eb:e5:79:3e:4e:a1:bc:12:39:8b:80:76:cc:3e:a9:10:60:83: -
fb:6d:f6:c7 - ./fb:6d:f6:c7 -


Cert info - I always check for a real CA or letsencrypt
Not Before: Apr 14 00:00:00 2020 GMT - ./Not Before: Apr 14 00:00:00 2020 GMT -
Not After : Jul 14 12:00:00 2021 GMT - ./Not After : Jul 14 12:00:00 2021 GMT -
Subject: C=US, ST=California, L=Palo Alto, O=Tesla Motors Inc, - ./Subject: C=US, ST=California, L=Palo Alto, O=Tesla Motors Inc, -
OU=ITOPS, CN=*.tesla.com - ./OU=ITOPS, CN=*.tesla.com -


Instant Portscan (not sure how many ports)
IP hostname          a23-64-192-243.deploy.static.akamaitechnologies.com - ./IP hostname          a23-64-192-243.deploy.static.akamaitechnologies.com -
Open Ports           80 443 - ./Open Ports           80 443 -
Port 443             Title: Invalid URL - ./Port 443             Title: Invalid URL - Server: AkamaiGHost - ./Server: AkamaiGHost -
Port 80              Title: Invalid URL - ./Port 80              Title: Invalid URL - Server: AkamaiGHost - ./Server: AkamaiGHost -

 - Very Accurate

 Attempts to GeoLocate:
 atitude / Longitude 47.60621 -122.33207 - ./Latitude / Longitude 47.60621 -122.33207 -
Time Zone            -07:00 - ./Time Zone            -07:00 -
ip2long              390119667 - ./ip2long              390119667 -
ISP                  Akamai Technologies - ./ISP                  Akamai Technologies -
Organization         Akamai Technologies - ./Organization         Akamai Technologies


