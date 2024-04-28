Filename: Xwebheaders.sh
Purpose: To use a bash script and curl and clearly display the headers, with ANSI including the content security policy and redirects
Note: output is to stdout and a file
      first param ($1) is https://my.url


Script:
------
#!/bin/bash

# Ensuring the output file is empty
> cspout.txt

# Using curl to follow redirects and capture all headers
curl -sIL --user-agent 'moz' -k "$1" | \
awk -v url="$1" -F': ' '
BEGIN {
    RED="\033[31m"; MAGENTA="\033[35m"; YELLOW="\033[93m"; CYAN="\033[36m"; BLUE="\033[34m"; RESET="\033[0m";
    print RED "Starting curl request..." RESET;
    header_count=0;
}
{
    if ($0 ~ /^HTTP/) {
        header_count++;
        if (header_count > 1) {
            printf RED "---------------\n" RESET;
        }
        print RED $0 RESET;
        print $0 >> "cspout.txt";
        next;
    }
    if (tolower($1) ~ /content-security-policy(-report-only)?/) {
        gsub(/; /, "\n\t", $2);
        printf MAGENTA "%s\033[0m:\n\t" RED "%s\033[0m\n", $1, $2;
        printf "%s: %s\n", $1, $2 >> "cspout.txt";
    } else if (tolower($1) ~ /report-to|nel/) {
        gsub(/,/, ",\n\t", $2);
        printf YELLOW "%s\033[0m:\n\t" CYAN "%s\033[0m\n", $1, $2;
        printf "%s: %s\n", $1, $2 >> "cspout.txt";
    } else {
        printf BLUE "%s\033[0m: " BLUE "%s\033[0m\n", $1, $2;
        printf "%s: %s\n", $1, $2 >> "cspout.txt";
    }
}' | perl -MURI::Escape -nle 'print uri_unescape($_)'

# Summarizing the header information at the end
echo -e "\nSummary of Response Codes and URLs:" >> cspout.txt
awk '/^HTTP/ {print $2, $3}' cspout.txt | sort | uniq -c | awk '{print $3, $2, "[" $1 "]"}' | \
while read line; do
    echo -e "$line"
done >> cspout.txt

# Displaying the summary on stdout
cat cspout.txt




----
Example:
 ./csp4.sh  https://thepiratebay.org  # The $1 param supports http or https and :// chars
 --------------------------------------------------
Starting curl request...

HTTP/2 302 
date: Sun, 28 Apr 2024 07:20:58 GMT
content-type: text/html
location: http://thepiratebay.org/index.html
cf-cache-status: DYNAMIC
report-to:
	{"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report\/v4?s=DZg+e1eaTY14vYMrmAmG6qGYViLJbRNHXIbuvgIorpOoTgK0YN9h+Ri9CgA0fVXydIJ7eJt9uTTRXCP/sRB57CIjCqRxCCtfcREo9OU0NNC/2DM8Wlrk3NXw1AmKgzmwTeWj"}],
	"group":"cf-nel",
	"max_age":604800}
nel:
	{"success_fraction":0,
	"report_to":"cf-nel",
	"max_age":604800}
server: cloudflare
cf-ray: 87b54af4eebf6a52-EWR
alt-svc: h3=":443"; ma=86400
: 
---------------  # This indicates a redirect
HTTP/1.1 301 Moved Permanently
Date: Sun, 28 Apr 2024 07:20:59 GMT
Content-Type: text/html
Content-Length: 167
Connection: keep-alive
Cache-Control: max-age=3600
Expires: Sun, 28 Apr 2024 08:20:59 GMT
Location: https://thepiratebay.org/index.html
Report-To:
	{"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report\/v4?s=ljvelsjVjhI3boNVD12oK37Szm2r86ETFPYYFC1Q2n14yQ+mHCqNgUsHU7iZcOUIFMr41u/ihriCYgFIqzQyYoMaO+MN/Vezaqm8ytbMdq6VbWNKpqQaPqkTBC/DMJonDqT9"}],
	"group":"cf-nel",
	"max_age":604800}
NEL:
	{"success_fraction":0,
	"report_to":"cf-nel",
	"max_age":604800}
Server: cloudflare
CF-RAY: 87b54af8db444289-EWR
alt-svc: h3=":443"; ma=86400
: 
---------------
HTTP/2 200 
date: Sun, 28 Apr 2024 07:21:01 GMT
content-type: text/html
vary: Accept-Encoding
vary: Accept-Encoding
vary: Accept-Encoding
last-modified: Mon, 25 Sep 2023 10:29:57 GMT
expires: Mon, 29 Apr 2024 07:21:00 GMT
cache-control: max-age=86400
cf-cache-status: DYNAMIC
report-to:
	{"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report\/v4?s=eui+axMVuaxKKpaJ0uLBkjCYmA58Cr2uEX3vLMZclN2edPSiaRrSdiciymyMjp2D3ca1sEUIt/72MjptsxCYluFzf8qP9pbL2npyAP8+2GtOKyGd5S3XaoAYEiIKpqwmvg0/"}],
	"group":"cf-nel",
	"max_age":604800}
nel:
	{"success_fraction":0,
	"report_to":"cf-nel",
	"max_age":604800}
server: cloudflare
cf-ray: 87b54af908e86a52-EWR
alt-svc: h3=":443"; ma=86400
: 
HTTP/2 302 
date: Sun, 28 Apr 2024 07:20:58 GMT
content-type: text/html
location: http://thepiratebay.org/index.html
cf-cache-status: DYNAMIC
report-to: {"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report\/v4?s=DZg%2Be1eaTY14vYMrmAmG6qGYViLJbRNHXIbuvgIorpOoTgK0YN9h%2BRi9CgA0fVXydIJ7eJt9uTTRXCP%2FsRB57CIjCqRxCCtfcREo9OU0NNC%2F2DM8Wlrk3NXw1AmKgzmwTeWj"}],
	"group":"cf-nel",
	"max_age":604800}
nel: {"success_fraction":0,
	"report_to":"cf-nel",
	"max_age":604800}
server: cloudflare
cf-ray: 87b54af4eebf6a52-EWR
alt-svc: h3=":443"; ma=86400

Summary of Response Codes and URLs:
 200 [1]
Moved 301 [1]
 302 [1]


---- I am still working on this, but i felt it useful to summarize the redir and status codes at the end.
-substance
