#!/bin/bash
# Filename: FormatHeaders.sh
# Dependencies:  perl with  URI::Escape 
# Purpose: to neatly format the output of curl -LI (show headers follow redirects)

curl -sI --user-agent 'moz' -k "$1" | awk -F': ' '
{
    if (NR == 1) {
        printf "\033[35m%s\34[0m\n", $0; next
    }
    if (tolower($1) ~ /content-security-policy(-report-only)?/) {
        gsub(/; /, "\n\t", $2);
        printf "\033[31m%s\033[0m:\n\t\033[35m%s\033[0m\n", $1, $2
    } else if (tolower($1) ~ /report-to|nel/) {
        gsub(/,/, ",\n\t", $2);
        printf "\033[93m%s\033[0m:\n\t\033[36m%s\033[0m\n", $1, $2
    } else {
        printf "\033[96m%s\033[0m: \033[34m%s\033[0m\n", $1, $2
    }
}' | perl -MURI::Escape -nle 'print uri_unescape($_)'



Example of output:
-----------
./FormatHeaders.sh https://www.msn.com
HTTP/2 404 
cache-control: no-store, no-cache
pragma: no-cache
content-length: 0
set-cookie: _C_ETH=1; domain=.msn.com; path=/; secure; httponly
set-cookie: _C_Auth=
set-cookie: MUID=159341E1xxxC657427515204B4B0647A; expires=Sun, 05 Jan 2025 01:42:30 GMT; domain=.msn.com; path=/; secure; samesite=none
set-cookie: MUIDB=159341Exxx2C657427515204B4B0647A; expires=Sun, 05 Jan 2025 01:42:30 GMT; path=/; httponly
set-cookie: _EDGE_S=F=1&SID=0274F8xxxx6E660EC0AF5EB3837A06190; domain=.msn.com; path=/; httponly
set-cookie: _EDGE_V=1; expires=Sun, 05 Jan 2025 01:42:30 GMT; domain=.msn.com; path=/; httponly
x-fabric-cluster: pmeprodwus
report-to:
        {"group":"network-errors",
        "max_age":604800,
        "endpoints":[{"url":"https://deff.nelreports.net/api/report?cat=msn"}]},
        {"group":"csp-endpoint",
        "max_age":86400,
        "endpoints":[{"url":"https://deff.nelreports.net/api/report"}]}
nel:
        {"report_to":"network-errors",
        "max_age":604800,
        "success_fraction":0.001,
        "failure_fraction":0.5}
x-ceto-ref: 3E6EACA7C9CD41279303BExxxx40941C|2023-12-12T01:42:30.642Z
x-cache: CONFIG_NOCACHE
accept-ch: Sec-CH-UA-Arch, Sec-CH-UA-Bitness, Sec-CH-UA-Full-Version, Sec-CH-UA-Full-Version-List, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA-Platform, Sec-CH-UA-Platform-Version
x-msedge-ref: Ref A
date: Tue, 12 Dec 2023 01:42:29 GMT
<snip>

----- This is an excellent way to examine the response headers from your target, using ansi colors and tabbing in
it makes it a heck of alot easier to look at.  


