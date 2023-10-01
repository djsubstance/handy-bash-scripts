#  methodCheck.sh
#  Purpose - check all possible URI and protocols for each method


#!/bin/bash
echo "trying CURL 100x for various methods on $1:"; echo
for i in {1..5}; do 
curl -sI -X OPTIONS https://$1/|grep -i "allow:"; 
curl -sI -X OPTIONS http://$1/|grep -i "allow:"; 
curl -sI -X OPTIONS http://www.$1/|grep -i "allow:"; 
curl -sI -X OPTIONS https://www.$1/|grep -i "allow:"; 
done



--- Example output
/bashchk.sh alaska.gov
trying CURL 100x for various methods on alaska.gov:

Allow: OPTIONS, TRACE, GET, HEAD, POST
Allow: OPTIONS, TRACE, GET, HEAD, POST
Allow: OPTIONS, TRACE, GET, HEAD, POST
Allow: OPTIONS, TRACE, GET, HEAD, POST
Allow: OPTIONS, TRACE, GET, HEAD, POST
Allow: OPTIONS, TRACE, GET, HEAD, POST
Allow: OPTIONS, TRACE, GET, HEAD, POST
Allow: OPTIONS, TRACE, GET, HEAD, POST



./bashchk.sh rit.edu
trying CURL 100x for various methods on rit.edu:

allow: GET, POST, DELETE, PATCH
allow: GET, POST, DELETE, PATCH
çallow: GET, POST, DELETE, PATCH
allow: GET, POST, DELETE, PATCH



