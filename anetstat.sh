# anetstat.sh
# Nice output of what is listening on your box

bash script: 
awk 'BEGIN{states["01"]="TCP_ESTABLISHED"
states["02"]="TCP_SYN_SENT"
states["03"]="TCP_SYN_RECV"
states["04"]="TCP_FIN_WAIT1"
states["05"]="TCP_FIN_WAIT2"
states["06"]="TCP_TIME_WAIT"
states["07"]="TCP_CLOSE"
states["08"]="TCP_CLOSE_WAIT"
states["09"]="TCP_LAST_ACK"
states["0A"]="TCP_LISTEN"
states["0B"]="TCP_CLOSING"
states["0C"]="TCP_NEW_SYN_RECV"
}
function hextodec(str,ret,n,i,k,c){
    ret = 0
    n = length(str)
    for (i = 1; i <= n; i++) {
        c = tolower(substr(str, i, 1))
        k = index("123456789abcdef", c)
        ret = ret * 16 + k
    }
    return ret
}
function getIP(str,ret){
    ret=hextodec(substr(str,index(str,":")-2,2));
    for (i=5; i>0; i-=2) {
        ret = ret"."hextodec(substr(str,i,2))
    }
    ret = ret":"hextodec(substr(str,index(str,":")+1,4))
    return ret
}
NR > 1 {{if(NR==2)print "Local - Remote";local=getIP($2);remote=getIP($3)}{print local" - "remote" "states[$4]}}' \ /proc/net/tcp


--- example output:
ocal - Remote
0.0.0.0:111 - 0.0.0.0:0 TCP_LISTEN
0.0.0.0:2049 - 0.0.0.0:0 TCP_LISTEN
0.0.0.0:42553 - 0.0.0.0:0 TCP_LISTEN
0.0.0.0:56635 - 0.0.0.0:0 TCP_LISTEN
127.0.0.53:53 - 0.0.0.0:0 TCP_LISTEN
127.0.0.54:53 - 0.0.0.0:0 TCP_LISTEN
0.0.0.0:56033 - 0.0.0.0:0 TCP_LISTEN
0.0.0.0:42419 - 0.0.0.0:0 TCP_LISTEN
0.0.0.0:44217 - 0.0.0.0:0 TCP_LISTEN





