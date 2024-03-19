Filename: updRedirChk.sh
Purpose: utilize 3rd party site to get header / redirect info

#!/bin/bash 

echo "-----------------------------------------------------"p

echo "[*] [WO-WWW] Checking site: $1 - via https://redirectchecker.com/api/redirect"
curl -skL --user-agent 'kona' 'https://redirectchecker.com/api/redirect' \
  -H 'authority: redirectchecker.com' \
  -H 'accept: */*' \
  -H 'accept-language: en-US,en;q=0.9,sv;q=0.8,no;q=0.7,ru;q=0.6,ja;q=0.5' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
  -H 'cookie: _ga=GA1.1.1526346099.1710273304; _ga_85FMB7HHLC=GS1.1.1710736116.4.0.1710736116.60.0.0' \
  -H 'dnt: 1' \
  -H 'origin: https://redirectchecker.com' \
  -H 'pragma: no-cache' \
  -H 'referer: https://redirectchecker.com/' \
  -H 'sec-ch-ua: "Chromium";v="118", "Google Chrome";v="118", "Not=A?Brand";v="99"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Kona' \
  -H 'x-requested-with: XMLHttpRequest' \
  --data-raw "url=https%3A%2F%2F$1&canonical=0&domainchk=www&useragent=Kona&strictssl=0&schemeless=0&password=&username=&Header_name=&Header_value=&dataType=json" | jq


Example Output:
---------------
[*] [WITHWWW] Checking site: www.tranceattic.com - via https://redirectchecker.com/api/redirect
{
  "web": [
    {
      "headers": {},
      "original": {
        "site_header": {
          "https://www.tranceattic.com": [
            {
              "domain": "https://www.tranceattic.com",
              "uid": "a65f9d1a4decaeb",
              "message": "Moved Permanently",
              "redirect": "https://tranceattic.com",
              "code": 301,
              "color": "#5b9bd5",
              "header": {
                "code": 301,
                "Date": "Tue, 19 Mar 2024 17:55:48 GMT",
                "Connection": "keep-alive",
                "Cache-Control": "max-age=3600",
                "Expires": "Tue, 19 Mar 2024 18:55:48 GMT",
                "Location": "https://tranceattic.com",
                "Report-To": "{\"endpoints\":[{\"url\":\"https:\\/\\/a.nel.cloudflare.com\\/report\\/v4?s=NK2MU%2F%2B5p3wssIVo5dPglMdyQkv0V6CR0gmuEkbPIe9yfUIJSLxQMnsYvC5wisYb8LXPoh4xf4Z7KuMT4MJtMeyHLchuWQLfwz8Uz3wXX8edJpsSkzHbzQ5%2FquXZkbflu6fLQOLJ\"}],\"group\":\"cf-nel\",\"max_age\":604800}",
                "NEL": "{\"success_fraction\":0,\"report_to\":\"cf-nel\",\"max_age\":604800}",
                "Strict-Transport-Security": "max-age=15552000; includeSubDomains; preload",
                "expect-ct": "max-age=86400, enforce",
                "referrer-policy": "same-origin",
                "x-content-type-options": "nosniff",
                "x-frame-options": "SAMEORIGIN",
                "x-xss-protection": "1; mode=block",
                "Server": "cloudflare",
                "CF-RAY": "866f55e67b8059f8-IAD",
                "alt-svc": "h3=\":443\"; ma=86400"
              }
            },
            {
              "domain": "https://www.tranceattic.com",
              "uid": "a65f9d1a4decbcb",
              "message": "Forbidden",
              "redirect": "https://www.tranceattic.com",
              "code": 403,
              "color": "#ff0000",
              "header": {
                "code": 403,
                "Date": "Tue, 19 Mar 2024 17:55:48 GMT",
                "Content-Type": "text/html; charset=UTF-8",
                "Connection": "close",
                "Accept-CH": "Sec-CH-UA-Bitness, Sec-CH-UA-Arch, Sec-CH-UA-Full-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA-Platform-Version, Sec-CH-UA-Full-Version-List, Sec-CH-UA-Platform, Sec-CH-UA, UA-Bitness, UA-Arch, UA-Full-Version, UA-Mobile, UA-Model, UA-Platform-Version, UA-Platform, UA",
                "Cross-Origin-Embedder-Policy": "require-corp",
                "Cross-Origin-Opener-Policy": "same-origin",
                "Cross-Origin-Resource-Policy": "same-origin",
                "Origin-Agent-Cluster": "?1",
                "Permissions-Policy": "accelerometer=(),autoplay=(),browsing-topics=(),camera=(),clipboard-read=(),clipboard-write=(),geolocation=(),gyroscope=(),hid=(),interest-cohort=(),magnetometer=(),microphone=(),payment=(),publickey-credentials-get=(),screen-wake-lock=(),serial=(),sync-xhr=(),usb=()",
                "cf-mitigated": "challenge",
                "cf-chl-out": "yaEKST711lJ8OeNBbj1LMm3H1vY4ypkr6VMTR0BnS/TQgB1LIfHmIZ4oA5QLYYnW389o3EHywC6rQ2JlnIxFyXgkLWZJVR8WKWcaZTJI2Tqq1nqBYtBrRP82fbkSKwWV$oRPa2SwmpbGxV5SyVjyn8A==",
                "Cache-Control": "private, max-age=0, no-store, no-cache, must-revalidate, post-check=0, pre-check=0",
                "Expires": "Thu, 01 Jan 1970 00:00:01 GMT",
                "Report-To": "{\"endpoints\":[{\"url\":\"https:\\/\\/a.nel.cloudflare.com\\/report\\/v4?s=UIwljkldDTdRuURu4dRZqiC1y%2F3kvEJsTtfhQ0DUOfXEJpXoL8pKBLJtxsonSfDMiKSPRYiz69XOfIb8hS3ZNR%2Ft8hD0pvrwC5TPDZ7Io79nQ%2BNpXGBJNmHWxY4PN66ui5c%3D\"}],\"group\":\"cf-nel\",\"max_age\":604800}",
                "NEL": "{\"success_fraction\":0,\"report_to\":\"cf-nel\",\"max_age\":604800}",
                "Strict-Transport-Security": "max-age=15552000; includeSubDomains; preload",
                "expect-ct": "max-age=86400, enforce",
                "referrer-policy": "same-origin",
                "x-content-type-options": "nosniff",
                "x-frame-options": "SAMEORIGIN",
                "x-xss-protection": "1; mode=block",
                "Server": "cloudflare",
                "CF-RAY": "866f55e6ae8720cc-IAD",
                "alt-svc": "h3=\":443\"; ma=86400"
              }
            }
          ]
        }
      },
      "exception": null
    }
  ]
}
-----------------------------------------------------p
[*] [WO-WWW] Checking site: tranceattic.com - via https://redirectchecker.com/api/redirect

{
  "web": [
    {
      "headers": {},
      "original": {
        "site_header": {
          "https://tranceattic.com": [
            {
              "domain": "https://tranceattic.com",
              "uid": "a65f9d1a53f03eb",
              "message": "Forbidden",
              "redirect": "https://tranceattic.com",
              "code": 403,
              "color": "#ff0000",
              "header": {
                "code": 403,
                "Date": "Tue, 19 Mar 2024 17:55:49 GMT",
                "Content-Type": "text/html; charset=UTF-8",
                "Connection": "close",
                "Accept-CH": "Sec-CH-UA-Bitness, Sec-CH-UA-Arch, Sec-CH-UA-Full-Version, Sec-CH-UA-Mobile, Sec-CH-UA-Model, Sec-CH-UA-Platform-Version, Sec-CH-UA-Full-Version-List, Sec-CH-UA-Platform, Sec-CH-UA, UA-Bitness, UA-Arch, UA-Full-Version, UA-Mobile, UA-Model, UA-Platform-Version, UA-Platform, UA",
                "Cross-Origin-Embedder-Policy": "require-corp",
                "Cross-Origin-Opener-Policy": "same-origin",
                "Cross-Origin-Resource-Policy": "same-origin",
                "Origin-Agent-Cluster": "?1",
                "Permissions-Policy": "accelerometer=(),autoplay=(),browsing-topics=(),camera=(),clipboard-read=(),clipboard-write=(),geolocation=(),gyroscope=(),hid=(),interest-cohort=(),magnetometer=(),microphone=(),payment=(),publickey-credentials-get=(),screen-wake-lock=(),serial=(),sync-xhr=(),usb=()",
                "Expires": "Thu, 01 Jan 1970 00:00:01 GMT",
                "Report-To": "{\"endpoints\":[{\"url\":\"https:\\/\\/a.nel.cloudflare.com\\/report\\/v4?s=g4sZYnHJeEo6Ltj%2Fvlhp0kYHSSbXiUzRfHXHDBNLwLKM6UDfZxGtSEkcHuE7tlwClZDmUQHFMQoT9XIQYIW9PccBoH2oUXBd2GpX1xPDagHjpi2NS4HXFZM7bk9JLuK1Xno%3D\"}],\"group\":\"cf-nel\",\"max_age\":604800}",
                "NEL": "{\"success_fraction\":0,\"report_to\":\"cf-nel\",\"max_age\":604800}",
                "Strict-Transport-Security": "max-age=15552000; includeSubDomains; preload",
                "expect-ct": "max-age=86400, enforce",
                "referrer-policy": "same-origin",
                "x-content-type-options": "nosniff",
                "x-frame-options": "SAMEORIGIN",
                "x-xss-protection": "1; mode=block",
                "Server": "cloudflare",
                "CF-RAY": "866f55e8c924598c-IAD",
                "alt-svc": "h3=\":443\"; ma=86400"
              }
            }
          ]
        }
      },
      "exception": null
    }
  ]
}
