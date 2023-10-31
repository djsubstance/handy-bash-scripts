Prereqs:  html2text 
filename: getCookies.sh - gets target cookie info from cookiepedia.co.uk 

#!/bin/bash
echo "Checking Cookies via cookiepedia.co.uk - Domain: $1";echo
curl -sLk --connect-timeout 3 "https://cookiepedia.co.uk/website/$1" -H 'User-Agent: Mozilla/5.0' \
  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8'  \
  -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: deflate' -H 'Referer: https://cookiepedia.co.uk/website/di.fm' \ 
  -H 'Connection: keep-alive' \ 
  -H 'Cookie: ARRAffinity=78573bd266cd96f01cdb67a787db49fa16bcbe38547dd180b7f44ec92c953b2e; ARRAffinitySameSite=78573bd266cd96f01cdb67a787db49fa16bcbe38547dd180b7f44ec92c953b2e; templateVariant=AK; OptanonConsent=isGpcEnabled=0&datestamp=Fri+Jan+13+2023+11%3A15%3A06+GMT-0500+(Eastern+Standard+Time)&version=202211.2.0&isIABGlobal=false&hosts=&consentId=588e79c4-0067-4932-a9fe-4d395a082aa5&interactionCount=2&landingPath=NotLandingPage&groups=1%3A1%2C2%3A0%2C3%3A0%2C4%3A0&AwaitingReconsent=false&geolocation=US%3BAK; OptanonAlertBoxClosed=2023-01-13T16:14:57.524Z' \ 
  -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: same-origin'| html2text 
echo

# eof 

example output:
Checking Cookies via cookiepedia.co.uk - Domain: dea.gov


[One of: website/cookie/3rd party host] [dea.gov             ] [Search]
****** Website Search Results: dea.gov ******
***** List of Cookies *****
Click on any cookie name to see more detail.
***** First Party Persistent Cookies *****
    * Cookie name: _ga
          o Life Span: 730 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Performance
          o About this Cookie: This cookie name is associated with Google
            Universal Analytics - which is a significant update to Google's
            more commonly... More
    * Cookie name: _gat
          o Life Span: 0 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Performance
          o About this Cookie: This cookie name is associated with Google
            Universal Analytics, according to documentation it is used to
            throttle the re... More
    * Cookie name: _gat_xxxxxxxxxxxxxxxxxxxxxxxxxx
          o Life Span: 0 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Targeting/Advertising
          o About this Cookie: Google Analytics Cookies More
    * Cookie name: _gid
          o Life Span: 1 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Performance
          o About this Cookie: This cookie name is associated with Google
            Universal Analytics. This appears to be a new cookie and as of
            Spring 2017 no... More
    * Cookie name: ak_bmsc
          o Life Span: 0 days
          o Is Secure? No
          o Is HTTP Only? Yes
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Strictly Necessary
          o About this Cookie: This cookie is associated with Akamai and is
            used to differentiate between traffic from humans and bots. More
    * Cookie name: bm_sv
          o Life Span: 0 days
          o Is Secure? No
          o Is HTTP Only? Yes
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Strictly Necessary
          o About this Cookie: This cookie is associated with Akamai and is
            used to differentiate between traffic from humans and bots. More
    * Cookie name: nmstat
          o Life Span: 1000 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Performance
          o About this Cookie: This cookie name is associated with the website
            analytics service provided by SiteImprove. It enables site owners
            to ga... More
***** Third Party Cookies from siteimproveanalytics.com *****
    * Cookie name: __cfduid
          o Type: persistent
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? Yes
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Unknown
          o About this Cookie: Cookie associated with sites using CloudFlare,
            used to speed up page load times. According to CloudFlare it is
            used to o... More
***** Third Party Cookies from 6018802.global.siteimproveanalytics.io *****
    * Cookie name: AWSELB
          o Type: session
          o Life Span: 0 days
          o Is Secure? Yes
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Unknown
          o About this Cookie: This cookie name is associated with the Amazon
            Web Services Elastic Load Balancing functionality for routing
            client requ... More
    * Cookie name: AWSELBCORS
          o Type: session
          o Life Span: 0 days
          o Is Secure? Yes
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Unknown
***** Third Party Cookies from nr-data.net *****
    * Cookie name: JSESSIONID
          o Type: session
          o Life Span: 0 days
          o Is Secure? Yes
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Performance
          o About this Cookie: General purpose platform session cookie, used by
            sites written in JSP. Usually used to maintain an anonymous user
            sessio... More

***** Third Party Cookies from cdn.syndication.twimg.com *****
    * Cookie name: lang
          o Type: session
          o Life Span: 0 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 10/11/2020
          o Purpose: Targeting/Advertising
          o About this Cookie: There are many different types of cookies
            associated with this name, and a more detailed look at how it is
            used on a par... More

Please Note: The list of cookies found on this site is an aggregate total. As
websites change, they may stop using some cookies and add new ones. Some
records may show when a cookie was last seen on a site â and this will give
some indication as to whether it is still in use. If the date is not available,
this may indicate it is no longer in use, although this is not always the case.
Unless otherwise stated, no information about the use of cookies on this site
has been verified by its owners.â
