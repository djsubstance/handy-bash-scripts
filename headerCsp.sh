Requires CPAN
cpan install URI::Escape


#!/bin/bash
# Filename: FormatHeaders.sh
# Dependencies:  perl with URI::Escape
# Purpose: to neatly format the output of curl -LI (show headers follow redirects)

curl -sLkI --user-agent 'moz' -k "$1" | awk -F': ' '
BEGIN { first_line = 1; }
{
    if (first_line) {
        printf "\033[35m%s\033[0m\n", $0;
        first_line = 0;
        next;
    }
    if (tolower($1) ~ /content-security-policy(-report-only)?/) {
        gsub(/; /, "\n\t", $2);
        printf "\033[97m%s\033[0m:\n\t\033[96m%s\033[0m\n", $1, $2  # Header in bright white, value in light cyan
    } else if (tolower($1) ~ /report-to|nel|cross-origin-opener-policy-report-only|cross-origin-embedder-policy-report-only|p3p|content-security-policy-report-only|x-frame-options|origin-trial|accept-ch|content-type|link/) {
        gsub(/,/, ",\n\t", $2);
        printf "\033[93m%s\033[0m:\n\t\033[96m%s\033[0m\n", $1, $2  # Changed color code here for light cyan
    } else {
        printf "\033[96m%s\033[0m: \033[34m%s\033[0m\n", $1, $2
    }
}' | perl -MURI::Escape -nle 'print uri_unescape($_)'


---- 
Example output:
HTTP/2 308 
retry-after: 0
content-type:
        text/html
location: https://www.pinterest.com/
accept-ranges: bytes
date: Sun, 21 Jan 2024 18:16:14 GMT
strict-transport-security: max-age=31536000; includeSubDomains; preload
content-length: 247
: 
: TP/2 200 
x-xss-protection: 1; mode=block
x-content-type-options:
        nosniff
vary: User-Agent, Accept-Encoding
x-ua-compatible: IE=edge
reporting-endpoints: coop-endpoint="https://www.pinterest.com/_/_/coop_report/", coep-endpoint="https://www.pinterest.com/_/_/coep_report/
"
cross-origin-opener-policy-report-only:
        same-origin; report-to="coop-endpoint"
cross-origin-embedder-policy-report-only:
        require-corp; report-to="coep-endpoint"
p3p:
        CP="This is not a P3P policy. See https://www.pinterest.com/_/_/help/articles/pinterest-and-p3p for more info."
content-security-policy:
        default-src 'self' blob
x-frame-options:
        SAMEORIGIN
origin-trial:
        AvlUIFJouPpJAKljRGh7EnYm2Brnx/eu51h39Z7p11vbzNlw2YhkUhxvxZdkS709VlGGNw4Gcg/a9mAzHDrEcQ0AAAB5eyJvcmlnaW4iOiJodHRwczovL3BpbnRlcmVzdC5jb206N
DQzIiwiZmVhdHVyZSI6IlNlbmRGdWxsVXNlckFnZW50QWZ0ZXJSZWR1Y3Rpb24iLCJleHBpcnkiOjE2ODQ4ODYzOTksImlzU3ViZG9tYWluIjp0cnVlfQ==
accept-ch:
        Sec-CH-UA-Full,
        Sec-CH-UA-Full-Version-List,
        Sec-CH-UA-Model,
        Sec-CH-UA-Platform-Version
content-type:
       CP="This is not a P3P policy. See https://www.pinterest.com/_/_/help/articles/pinterest-and-p3p for more info."
content-security-policy:
        default-src 'self' blob
x-frame-options:
        SAMEORIGIN
origin-trial:
        AvlUIFJouPpJAKljRGh7EnYm2Brnx/eu51h39Z7p11vbzNlw2YhkUhxvxZdkS709VlGGNw4Gcg/a9mAzHDrEcQ0AAAB5eyJvcmlnaW4iOiJodHRwczovL3BpbnRlcmVzdC5jb206N
DQzIiwiZmVhdHVyZSI6IlNlbmRGdWxsVXNlckFnZW50QWZ0ZXJSZWR1Y3Rpb24iLCJleHBpcnkiOjE2ODQ4ODYzOTksImlzU3ViZG9tYWluIjp0cnVlfQ==
accept-ch:
        Sec-CH-UA-Full,
        Sec-CH-UA-Full-Version-List,
        Sec-CH-UA-Model,
        Sec-CH-UA-Platform-Version
content-type:
        text/html; charset=utf-8
link:
        <https://i.pinimg.com>; rel=preconnect; crossorigin=anonymous,
         <https://s.pinimg.com>; rel=preconnect; crossorigin=anonymous,
         <https://v1.pinimg.com>; rel=preconnect; crossorigin=anonymous
x-envoy-upstream-service-time: 164
pinterest-generated-by: coreapp-webapp-prod-0a03b54a
pinterest-version: d0cd2c5
referrer-policy: origin
x-pinterest-rid: 9318134697844323
date: Sun, 21 Jan 2024 18:16:14 GMT
alt-svc: h3=":443"; ma=600
content-length: 1
set-cookie: csrftoken=e653c66359bae8ff3a39b7a236aba22d; path=/; expires=Mon, 20 Jan 2025 18:16:14 GMT; samesite=lax; secure
set-cookie: _pinterest_sess=TWc9PSZja3U5QVh4SEMxenJPa3lxRzIxcGhLUXB5b2x1MUtPZnM2YTc1b3h4M2RiYXVZekVIUVRiOTJSb2RSM3plb3lBV2tXbFJQa3RtSkk1Zk
9zSlRaWVppODk1Tmw4bkxnYXNWK1pNYlp6L3JSST0mbG40K0F4a0JFcnpzaElWSlI4MGY5SlVJditVPQ==; path=/; expires=Wed, 15 Jan 2025 18:16:14 GMT; domain=.pinterest.
com; samesite=none; secure; httponly
set-cookie: _auth=0; path=/; expires=Wed, 15 Jan 2025 18:16:14 GMT; domain=.pinterest.com; secure; httponly
set-cookie: _routing_id="963ea337-3981-42d8-bb05-60e0a336d879"; Max-Age=86400; Path=/; HttpOnly
akamai-grn: 0.26d53e17.1705860974.169915bd
x-cdn: akamai
strict-transport-security: max-age=31536000 ; includeSubDomains ; preload

