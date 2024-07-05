Filename: dcodeobfuscatedGoogle.sj
requirements: bash / nothing else
purpose: Make readable certain google urls (obfuscated ones)
Script type: echo "urlfrom google" | ./<this.script>
It must have chmod +x


 #!/bin/bash

# ANSI color codes
CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

# Read URL from standard input
read url

# Decode the URL
base_url=$(echo "$url" | sed -e 's|/_[^/]*|/_/|')
params_string=$(echo "$url" | sed -e 's|.*_/js/||')

echo -e "Base URL: ${CYAN}${base_url}${NC}"

# Split parameters into key-value pairs
IFS='/' read -ra params <<< "$params_string"
for param in "${params[@]}"; do
  key=$(echo "$param" | awk -F'=' '{print $1}')
  value=$(echo "$param" | awk -F'=' '{print $2}')
  echo -e "${CYAN}${key}${NC}: ${LIGHT_CYAN}${value}${NC}"
done




====

Savee as dcode.sh
chmod +x ./dcode.sh
now you can pipe to it:   example would be:

echo "https://www.gstatic.com/_/mss/boq-one-google/_/js/k=boq-one-google.OneGoogleWidgetUi.ca.fylmryn5-0A.es5.O/am=EIbBZgM/d=1/excm=_b,_tp,appwidgetnoauthview/ed=1/dg=0/wt=2/ujg=1/rs=AM-SdHt47Fsi0_NR]jxv91R_1D29KAxuSyfA/m=_b,_tp" | ./dcode.sh

output:
Base URL: https://www.gstatic.com/_//mss/boq-one-google/_/js/k=boq-one-google.OneGoogleWidgetUi.ca.fylmryn5-0A.es5.O/am=EIaBZgM/d=1/excm=_b,_tp,appwidgetnoauthview/ed=1/dg=0/wt=2/ujg=1/rs=AM-SdHt47Fsi0_NRxv91R_1D29KAxuSyfA/m=_b,_tp

k: boq-one-google.OneGoogleWidgetUi.ca.fylmryn5-0A.es5.O
am: EIaBZgM
d: 1
excm: _b,_tp,appwidgetnoauthview
ed: 1
dg: 0
wt: 2
ujg: 1
rs: AM-SdHt47Fsi0_NRxv91R_1D29KAxuSyfA
m: _b,_tp


Note:
This is still obfuscated and I believe you can reference and look the key/vaue pairs by referencing (Google/Bing) the terms:
   gRPC
   Google obfuscated urls
Then look for any info (it is out there) as to what these variables are and the purpose



