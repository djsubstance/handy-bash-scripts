# Encode String with urlencoding / only special chars

urlencode() { 
  local string="${1}"; 
  local strlen=${#string}; 
  local encoded=""; 
  local pos c o; 
    for (( pos=0 ; pos<strlen ; pos++ ));                                                                                                        
     do c=${string:$pos:1}; 
      case "$c" in [-_.~a-zA-Z0-9] )                                                                
       o="${c}" ;; * ) 
       printf -v o '%%%02x' "'$c";
      esac; encoded+="${o}";
     done;
    echo "${encoded}"| sed 's/\./%2e/g'; 
            }  

Example
urlencode "https://www.msn.com/this/that?other=thing"
https%3a%2f%2fwww%2emsn%2ecom%2fthis%2fthat%3fother%3dthing

    
