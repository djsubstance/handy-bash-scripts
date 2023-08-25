# one liners worth lookgin at
Dope 9x prompt:
export PS1='\e[1;30m[\e[1;37m9x\e[1;30m]\e[1;37m::\e[0;37m\][\[\e[1;30m\]\@\[\e[0;37m\]]\e[0;35m:\e[0;37m[\[\e[0;37m\
]\e[1;37m\w\[\e[0;37;40m\]]\n\[\e[0;37m\][\[\e[1;36m\]\u\[\e[1;30m\]@\[\e[1;36m\]\h\[\e[0;37m\]]\[\e[0m\]\$ '


curl -sLk 'https://searchcode.com/api/codesearch_I/?q=AWS_SECRET&lan=230&lan=22'| jq
Prox() (curl 'https://www.codebeautify.com/URLService'   -H 'authority: www.codebeautify.com'   -H 'accept: */*'   -H 'accept-language: en-US,en;q=0.9'   -H 'cache-control: no-cache'   -H 'content-type: application/x-www-form-urlencoded'   -H 'dnt: 1'   -H 'origin: https://codebeautify.org'   -H 'pragma: no-cache'   -H 'referer: https://codebeautify.org/'   -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"'   -H 'sec-ch-ua-mobile: ?0'   -H 'sec-ch-ua-platform: "Windows"'   -H 'sec-fetch-dest: empty'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-site: cross-site'   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'   --data-raw "path=https%3A%2F%2F$1" )

webExif() ( curl -sLk "https://exifinfo.org/url?url=https%3A%2F%2F$1"   -H 'authority: exifinfo.org'   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7'   -H 'accept-language: en-US,en;q=0.9'   -H 'referer: https://exifinfo.org/detail/Y63C9Nj87SLMphgbDWvcjg'   -H 'sec-ch-ua: "Microsoft Edge";v="111", "Not(A:Brand";v="8", "Chromium";v="111"'   -H 'sec-ch-ua-platform: "Windows"'   -H 'sec-fetch-dest: document'   -H 'sec-fetch-mode: navigate'   -H 'sec-fetch-site: same-origin'   -H 'sec-fetch-user: ?1'   -H 'upgrade-insecure-requests: 1'   -H 'user-agent: Mozilla' | html2text | tee webExif-$1.txt)
dumpSrc() ( curl -s 'https://www.view-page-source.com/' -X POST -H 'User-Agent: Mozilla/5.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: deflate' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Referer: https://www.view-page-source.com/' -H 'Origin: https://www.view-page-source.com' -H 'DNT: 1' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: same-origin' -H 'Sec-Fetch-User: ?1' -H 'Connection: keep-alive' -H 'Cookie: _ga_B3W86S4WQ2=GS1.1.1680622601.1.0.1680622601.0.0.0; _ga=GA1.11214855363.1680622601; cookieConsentAccepted=YES' --data-raw "reference_id=1&vps_token=SeklugwIkuKucy.dryKY&uri=https%3A%2F%2F$1&stylize=stylize" )

alias urls=" sed 's/http/\nhttp/g' | grep ^http | sed 's/\(^http[^<]*\)\(.*\)/\1/g'"




