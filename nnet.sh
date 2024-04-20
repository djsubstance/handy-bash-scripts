Filename; nnet.sh


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
NR > 1 {{if(NR==2)print "Local - Remote";local=getIP($2);remote=getIP($3)}{print local" - "remote" "states[$4]}}' /proc/net/tcp


output:
Example:
Local - Remote
127.0.0.53:53 - 0.0.0.0:0 TCP_LISTEN
10.8.4.1:80 - 0.0.0.0:0 TCP_LISTEN
127.0.0.54:53 - 0.0.0.0:0 TCP_LISTEN
127.0.0.1:6024 - 0.0.0.0:0 TCP_LISTEN
10.8.4.1:3128 - 0.0.0.0:0 TCP_LISTEN
64.x.191.232:49312 - 144.24.33.7:22 TCP_ESTABLISHED
64.x.191.232:51446 - 144.24.33.7:22 TCP_ESTABLISHED
64.x.191.232:33432 - 144.24.33.7:22 TCP_TIME_WAIT
627.0.0.1:6024 - 127.0.0.1:41012 TCP_CLOSE_WAIT

