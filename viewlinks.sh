# viewlinks.sh
# Description: This Bash script requires no dependencies just curl - as of 9/26/2023 it allows 
#   us to leverage the services on the site to extract all http://XXX links off target
# one tip - I tried for instance ./viewlinks.sh rit.edu - no  output
# however ./viewlinks www.rit.edu works - try both

#!/bin/bash
echo "Scraping all links from: $1";
echo
curl -sL --user-agent 'Mozilla/1.1' "https://www.html-code-generator.com/tools/link-extractor/?url=https%3A%2F%2F$1&link_type=all&_=1679614441236"  \
  -H 'authority: www.html-code-generator.com'  \
  -H 'accept: application/json, text/javascript, */*; q=0.01' \
  -H 'accept-language: en-US,en;q=0.9' \
  -H 'cache-control: no-cache' \
  -H 'cookie: apmmpaebfobifelkijhaljbmpcgbjbdo=382decdf-97da-4657-a686-1ba0854295c0; hcguser=sq4csuj0f789avt7fipl1s5968; hcgants=BCCDOS; dark-mode=dark; apmmpaebfobifelkijhaljbmpcgbjbdo=31952aed-1e17-4ef9-9d32-e794a75c3241'   -H 'dnt: 1'   -H 'pragma: no-cache'   -H 'referer: https://www.html-code-generator.com/tools/url-extractor'   -H 'sec-ch-ua: "Brave";v="111", "Not(A:Brand";v="8", "Chromium";v="111"'   -H 'sec-ch-ua-mobile: ?0'   -H 'sec-ch-ua-platform: "macOS"'   -H 'sec-fetch-dest: empty'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-site: same-origin'   -H 'sec-gpc: 1' \
  -H 'user-agent: Mozilla/5.0' -H 'x-requested-with: XMLHttpRequest'  | jq
[EOF] - THE jq is not manndatory

You may need to go back to this site and right click inspect prior to doing the lookup anbd in the 
network tab, right click the entry that fetchs the links, goto copy -> as bash cmd
Note: It follows unlimited redirects which can break it. the site only allows 5

./viewlinks.sh www.x.com| more
Scraping all links from: www.x.com

{
  "status": false,
  "msg": "Error Maximum (5) redirects followed"
}

^ That is on x.com
=========================
Here is proper output:


Scraping all links from: www.rit.edu

{
  "status": true,
  "total_link": 137,
  "links": [
    {
      "url": "https://www.rit.edu/",
      "name": ""
    },
    {
      "url": "https://www.rit.edu/request-information",
      "name": "Request Info"
    },
    {
      "url": "https://www.rit.edu/visit",
      "name": "Visit"
    },
    {
      "url": "https://www.rit.edu/admissions/apply",
      "name": "Apply"
    {
      "url": "https://www.rit.edu/giving/",
      "name": "Give"
    },
    {
      "url": "https://www.rit.edu/about-rit",
      "name": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tOverview of RIT\n\t\t\t\t\t\t\t\t\t\t
\t"
    },
    {
      "url": "https://www.rit.edu/uniquely-rit",
      "name": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tUniquely RIT\n\t\t\t\t\t\t\t\t\t\t\t"
    },
    {
      "url": "https://www.rit.edu/history-rit",
      "name": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tHistory of RIT\n\t\t\t\t\t\t\t\t\t\t\
t"
    },
    {
      "url": "https://www.rit.edu/university-leadership",
      "name": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tUniversity Leadership\n\t\t\t\t\t\t\t
\t\t\t\t"
  {
      "url": "https://www.rit.edu/giving/",
      "name": "Give"
    },
    {
      "url": "https://www.rit.edu/about-rit",
      "name": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tOverview of RIT\n\t\t\t\t\t\t\t\t\t\t
\t"
    },
    {
      "url": "https://www.rit.edu/uniquely-rit",
      "name": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tUniquely RIT\n\t\t\t\t\t\t\t\t\t\t\t"
    },
    {
      "url": "https://www.rit.edu/history-rit",
      "name": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tHistory of RIT\n\t\t\t\t\t\t\t\t\t\t\
t"
    },
    {
      "url": "https://www.rit.edu/university-leadership",
      "name": "\n\t\t\t\t\t\t\t\t\t\t\t\t\tUniversity Leadership\n\t\t\t\t\t\t\t
\t\t\t\t"
 - If you dont want all the fluffy there, just grep it:


bash$ ./viewlinks.sh www.rit.edu | grep 'url' | more
   "url": "https://www.rit.edu/request-information",
      "url": "https://www.rit.edu/visit",
      "url": "https://www.rit.edu/admissions/apply",
      "url": "https://www.rit.edu/giving/",
      "url": "https://www.rit.edu/about-rit",
      "url": "https://www.rit.edu/uniquely-rit",
      "url": "https://www.rit.edu/history-rit",
      "url": "https://www.rit.edu/university-leadership",
      "url": "https://www.rit.edu/rochester-ny",
      "url": "https://www.rit.edu/careers",
      "url": "https://www.rit.edu/contact",
      "url": "https://www.rit.edu/campuses",
      "url": "https://www.rit.edu/rankings-and-recognition",
      "url": "https://www.rit.edu/discover-rit",
      "url": "https://www.rit.edu/faces",
      "url": "https://www.rit.edu/academics",
      "url": "https://www.rit.edu/study/undergraduate",
      "url": "https://www.rit.edu/study/graduate",
      "url": "https://www.rit.edu/study/combined-accelerated-bachelors-masters",
      "url": "https://certified.rit.edu",
      "url": "https://www.rit.edu/colleges",

------- Thats what im talking about
Keep the information free and flowing
dj substance
tranceattic.com


