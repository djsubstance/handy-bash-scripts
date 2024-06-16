Filename: csp_v3.sh
Purpose: identify in a clear colorful way in CLI the headers and CSP of remote web server

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



Usage:
./csp_v3.sh <host>

Example:
./csp_v3.sh https://msnbc.com
HTTP/1.1 301 Moved Permanently
Server: AkamaiGHost
Content-Length: 0
Location: https://www.msnbc.com/
Date: Sun, 16 Jun 2024 05:04:02 GMT
Connection: keep-alive
Set-Cookie: ng_geolocation=US; path=/; domain=.msnbc.com; secure; SameSite=None
Strict-Transport-Security: max-age=2628000 ; preload
Content-Security-Policy:
	upgrade-insecure-requests;
Content-Security-Policy:
	frame-ancestors 'self' https://*.nbcnews.com https://*.today.com https://*.msnbc.com https://*.telemundo.com https://*.nbcnewstools.net https://*.eonline.com https://*.cnbc.com
X-Frame-Options:
	SAMEORIGIN
Set-Cookie: akaas_MSNBC=1719378242~rv=42~id=24f954b4b31b83a0f47a0231c8c92caa~rn=; path=/; Expires=Wed, 26 Jun 2024 05:04:02 GMT; Secure; SameSite=None
: 
: TP/1.1 200 OK
Content-Type:
	text/html; charset=utf-8
Server: nginx
X-Powered-By: Next.js
Content-Language: en
Link:
	<https://nodeassets.nbcnews.com>; rel=preconnect; crossorigin=anonymous,
	 <https://media-cldnry.s-nbcnews.com>; rel=preconnect,
	 <https://securepubads.g.doubleclick.net>; rel=preconnect,
	 <https://mps.nbcuni.com/fetch/ext/load-nbcnews-bento.js?nowrite=jq>; as=script; rel=preload
ETag: W/"b96d2-BkLgR2aXRp20reTYfzfD9QP/Y4M"
X-Backend-Server: blue-ramen2-7cdfc9bbbc-skm5z
Cache-Control: private, no-cache, no-store, must-revalidate
Date: Sun, 16 Jun 2024 05:04:02 GMT
Connection: keep-alive
Set-Cookie: ng_geolocation=US; path=/; domain=.msnbc.com; secure; SameSite=None
Strict-Transport-Security: max-age=2628000 ; preload
Content-Security-Policy:
	upgrade-insecure-requests;
Content-Security-Policy:
	frame-ancestors 'self' https://*.nbcnews.com https://*.today.com https://*.msnbc.com https://*.telemundo.com https://*.nbcnewstools.net https://*.eonline.com https://*.cnbc.com
X-Frame-Options:
	SAMEORIGIN
Set-Cookie: akaas_MSNBC=1719378242~rv=94~id=8197a8a19f0962bd8898cfa9c20f4ea3~rn=; path=/; Expires=Wed, 26 Jun 2024 05:04:02 GMT; Secure; SameSite=None
: 
