# Prereqs - apt-get install html2text / curl
# Verify you can connect to cookiepedia.co.uk

# Usage:  ./getCookie.sh <domain.com>
# This leverages 3rd party site to analyze cookies in depth

# Filename: getCookie.sh

echo "Checking Cookies via cookiepedia.co.uk - Domain: $1";echo
curl -sLk --connect-timeout 3 "https://cookiepedia.co.uk/website/$1" -H 'User-Agent: Mozilla/5.0'  -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: deflate' -H 'Referer: https://cookiepedia.co.uk/website/di.fm' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Cookie: ARRAffinity=78573bd266cd96f01cdb67a787db49fa16bcbe38547dd180b7f44ec92c953b2e; ARRAffinitySameSite=78573bd266cd96f01cdb67a787db49fa16bcbe38547dd180b7f44ec92c953b2e; templateVariant=AK; OptanonConsent=isGpcEnabled=0&datestamp=Fri+Jan+13+2023+11%3A15%3A06+GMT-0500+(Eastern+Standard+Time)&version=202211.2.0&isIABGlobal=false&hosts=&consentId=588e79c4-0067-4932-a9fe-4d395a082aa5&interactionCount=2&landingPath=NotLandingPage&groups=1%3A1%2C2%3A0%2C3%3A0%2C4%3A0&AwaitingReconsent=false&geolocation=US%3BAK; OptanonAlertBoxClosed=2023-01-13T16:14:57.524Z' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: same-origin'| html2text 
echo

# It is recommended to |tee this output to another file to read it can be long

# Example:
# ./getCookie.sh www.msnbc.com
Checking Cookies via cookiepedia.co.uk - Domain: www.msnbc.com

# Warning output can be LONG
****** Website Search Results: www.msnbc.com ******
***** List of Cookies *****
Click on any cookie name to see more detail.
***** First Party Persistent Cookies *****
    * Cookie name: __gads
          o Life Span: 730 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Targeting/Advertising
          o About this Cookie: This cookie is associated with the DoubleClick
            for Publishers service from Google. Its purpose is to do with the
            showing... More
    * Cookie name: _awl
          o Life Span: 1095 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dy_c_exps
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dy_df_geo
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Targeting/Advertising
          o About this Cookie: Stores the geographical location of browsers and
            targets ads.  More
    * Cookie name: _dy_geo
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Targeting/Advertising
          o About this Cookie: Stores the geographical location of browsers and
            targets ads.  More
    * Cookie name: _dy_ses_load_seq
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dy_soct
          o Life Span: 365 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dy_toffset
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dycnst
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dycst
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dyid
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dyus_8765952
          o Life Span: 30 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _fbp
          o Life Span: 90 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Targeting/Advertising
          o About this Cookie: Used by Facebook to deliver a series of
            advertisement products such as real time bidding from third party
            advertisers More
    * Cookie name: _ga
          o Life Span: 730 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Performance
          o About this Cookie: This cookie name is associated with Google
            Universal Analytics - which is a significant update to Google's
            more commonly... More
    * Cookie name: _gat
          o Life Span: 0 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Performance
          o About this Cookie: This cookie name is associated with Google
            Universal Analytics, according to documentation it is used to
            throttle the re... More
    * Cookie name: _gcl_au
          o Life Span: 90 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Targeting/Advertising
          o About this Cookie: Used by Google AdSense for experimenting with
            advertisement efficiency across websites using their services More
    * Cookie name: _gid
          o Life Span: 1 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Performance
          o About this Cookie: This cookie name is associated with Google
            Universal Analytics. This appears to be a new cookie and as of
            Spring 2017 no... More
    * Cookie name: _nv
          o Life Span: 7300 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _parsely_session
          o Life Span: 0 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Functionality
          o About this Cookie: This cookie is used to determine if the visitor
            has visited the website before, or if it is a new visitor on the
            website... More
    * Cookie name: _parsely_visitor
          o Life Span: 730 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Functionality
          o About this Cookie: This cookie is used to determine if the visitor
            has visited the website before, or if it is a new visitor on the
            website... More
***** First Party Session Cookies *****
    * Cookie name: _dy_csc_ses
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dy_ssn_strt
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dyfs
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
    * Cookie name: _dyjsession
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
***** Third Party Cookies from .cdn.dynamicyield.com *****
    * Cookie name: __cfduid
          o Type: persistent
          o Life Span: 365 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
          o About this Cookie: Cookie associated with sites using CloudFlare,
            used to speed up page load times. According to CloudFlare it is
            used to o... More
***** Third Party Cookies from .dynamicyield.com *****
    * Cookie name: __cfduid
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Unknown
          o About this Cookie: Cookie associated with sites using CloudFlare,
            used to speed up page load times. According to CloudFlare it is
            used to o... More
***** Third Party Cookies from .taboola.com *****
    * Cookie name: __cfduid
          o Type: persistent
          o Life Span: 365 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
          o About this Cookie: Cookie associated with sites using CloudFlare,
            used to speed up page load times. According to CloudFlare it is
            used to o... More
***** Third Party Cookies from .exposebox.com *****
    * Cookie name: __etn
          o Type: persistent
          o Life Span: 360 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Unknown
***** Third Party Cookies from .adsby.bidtheatre.com *****
    * Cookie name: __kuid
          o Type: persistent
          o Life Span: 7 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 30/05/2021
          o Purpose: Targeting/Advertising
          o About this Cookie: Registers a unique ID that identifies a
            returning user's device. The ID is used for targeted ads.  More
***** Third Party Cookies from delivery.nbc.switchadhub.com *****
    * Cookie name: __SWST
          o Type: persistent
          o Life Span: 0 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/02/2019
          o Purpose: Unknown
***** Third Party Cookies from .crwdcntrl.net *****
    * Cookie name: _cc_aud
          o Type: persistent
          o Life Span: 178 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 30/05/2021
          o Purpose: Targeting/Advertising
          o About this Cookie: This domain is owned by Lotame. The main
            business activity is: Data Management Platform - Targeting /
            Advertising More
    * Cookie name: _cc_dc
          o Type: persistent
          o Life Span: 178 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 30/05/2021
          o Purpose: Targeting/Advertising
          o About this Cookie: This domain is owned by Lotame. The main
            business activity is: Data Management Platform - Targeting /
            Advertising More
***** Third Party Cookies from .fwmrm.net *****
    * Cookie name: _uid
          o Type: persistent
          o Life Span: 365 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 08/08/2022
          o Purpose: Targeting/Advertising
          o About this Cookie: This cookie is used to enable user to share
            pages through third party social networking websites.  More
***** Third Party Cookies from pubmatic.com *****
    * Cookie name: 16087-3777424180094056881
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 16087-7930348669481687841
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/02/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 16532-1c44fbb1-8e22-4370-81da-536d2354fc26
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/02/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 16532-57ef7f16-f5a0-4dfe-82e1-91439c846002
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 16736-uid:56fd5bf8-960a-4100-b53e-a6b7e72f34df
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/02/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 16736-uid:60495c71-dfc0-4300-94c4-e754ef6a98ca
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22716-no-consent
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22776-5450435258310602055
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22918-5be530d4-b747-453a-9d63-4beecdc538b6
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22922-W-iWqQAAAF5I7GLA
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/02/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22922-XHHhHQAAAKs3m0ow
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22978-XHHhHQAAAKs3m0ow
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22979-yM46is3KPYjQx23YzZl02J-baIDQm2qJzc3s37rV
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22987-CAESEF5eaONEPy1AjSO60On-Xds
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22987-CAESEGumUyAO5ZzhpQuwn-bod74
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/02/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 22995-CAESEF5eaONEPy1AjSO60On-Xds
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising
    * Cookie name: 23025-CAESEF5eaONEPy1AjSO60On-Xds
          o Type: persistent
          o Life Span: 2914945 days
          o Is Secure? No
          o Is HTTP Only? No
          o Path: /
          o Last Seen Date: 24/05/2019
          o Purpose: Targeting/Advertising

    





