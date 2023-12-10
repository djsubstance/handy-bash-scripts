# Filename: sshot-API.sh
# prereqs: need valid api from https://api.c99.nl

echo
c99="XXXX3-GNEQL-PSWX5-Y8HZF"  # Set API from api.c99.nl
curl -s "https://api.c99.nl/createscreenshot?key=$c99&url=https://$1";echo
echo "saved $1";


Returns a url

