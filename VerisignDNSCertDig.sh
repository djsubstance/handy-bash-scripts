#kick ass deep dig off 3rd party site

#!/bin/bash
echo "checking $1";echo
curl -s# "https://dnssec-analyzer.verisignlabs.com/$1" -H 'Connection: keep-alive'   -H 'Pragma: no-cache'   -H 'Cache-Control: no-cache'   -H 'DNT: 1'   -H 'Upgrade-Insecure-Requests: 1'   -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36'   -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9'   -H 'Sec-Fetch-Site: none'   -H 'Sec-Fetch-Mode: navigate'   -H 'Sec-Fetch-User: ?1'   -H 'Sec-Fetch-Dest: document'   -H 'Accept-Language: en-US,en;q=0.9';echo


Usage:
./veri.sh cnn.com|html2text | tee teeeee

<snip>
                   ;; QUESTION SECTION (1 record)
                   ;; com.      IN      DNSKEY

                   ;; ANSWER SECTION (4 records)
                   com. 86400   IN      DNSKEY  ( 256 3 8
                        AwEAAaI/e5KtPCe4+wzT9qa9oOZHxAyYSdJRWA1u/JAjTZ3SsDJCpa6s7CPq3dLGe840hc+VEFVN
                        I+fe5SFgMxjBjnpDQl7kke4E0sVjKLxARUBOpCi+ZPetDBJk8+O2YmV0j9FLfu24ECS/Z8IME+YE
                        +nCpq7m+OsUInxfvhuDI6raU6Z+lIodexXfDUejuasDGhfkecUNQM935zwWwNuUuHxk= )
                        ; Key ID = 4459
                   com. 86400   IN      DNSKEY  ( 256 3 8
                        AwEAAcbxnScZaHfDT9aepsoUJgaaVLBPtxmQ7W/yj3Vmnn6JNaCJ/Z3cTrpmw1f3xlH127F1Zoe3
                        bMO18wOfsI26I9k4GTMIo3FtODyQud7c52nS4gHOaeiuncejfokqg79cGr7AUNCtZVrAW74eshI3
                        3py92W1sCkAm/rSsgygyWNYrsM8f8DLoMHaXngn9RhSKkehMFiLMCoBUvsVfvFRlJh8= )
                        ; Key ID = 63246
                   com. 86400   IN      DNSKEY  ( 257 3 8
                        AQPDzldNmMvZFX4NcNJ0uEnKDg7tmv/F3MyQR0lpBmVcNcsIszxNFxsBfKNW9JYCYqpik8366LE7
                        VbIcNRzfp2h9OO8HRl+H+E08zauK8k7evWEmu/6od+2boggPoiEfGNyvNPaSI7FOIroDsnw/tagg
                        zHRX1Z7SOiOiPWPNIwSUyWOZ79VmcQ1GLkC6NlYvG3HwYmynQv6oFwGv/KELSw7ZSdrbTQ0HXvZb
                        qMUI7BaMskmvgm1G7oKZ1YiF7O9ioVNc0+7ASbqmZN7Z98EGU/Qh2K/BgUe8Hs0XVcdPKrtyYnoQ
                        Hd2ynKPcMMlTEih2/2HDHjRPJ2aywIpKNnv4oPo/ ) ; Key ID = 30909
                   com. 86400   IN      RRSIG   ( DNSKEY 8 1 86400 20231022172421 20231007171921 30909
                   com.
                        mrHSedgJrevEtCjO50iuiW7hf7xmuO8R1EJ+88DeGoBkMZelnwuu4OilTpdqX0Crq5M4J8PqvVal
                        WKB1/rLZH9PzznaY3+od+XwuqHgFsGrxMSzfWHqQj56Klq6IscDjddXCmhWOMlMJ2PJVPV9JqfG+
                        VnZFw+LYt6UyNU30vWidklZ1JBVofPU3PNqajyFnDpWlAXr0GW5qnFI6uHxrZdLgGPfMCq54tjJc
                        7ZQntVupPdoK8RcOxmPnpSO2GFxDSdv5Yjha8tG+TjoA25o+NjGKcTalnQeHyrR9pLHb64Fw9IL6
                        450Z1OWxmQ4jHhvqCy0rOzfOj39UpGGi5bFSCw== )

                   ;; AUTHORITY SECTION (0 records)

                   ;; ADDITIONAL SECTION (1 record)
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

        [/         Found 3 DNSKEY records for com
        green.png]
                   com. 86400 IN DNSKEY ( 256 3 8 AwEAAaI/e5KtPCe4+wzT9qa9oOZHxAyYSdJRWA1u/
                   JAjTZ3SsDJCpa6s7CPq3dLGe840hc+VEFVN
                  I+fe5SFgMxjBjnpDQl7kke4E0sVjKLxARUBOpCi+ZPetDBJk8+O2YmV0j9FLfu24ECS/Z8IME+YE
                   +nCpq7m+OsUInxfvhuDI6raU6Z+lIodexXfDUejuasDGhfkecUNQM935zwWwNuUuHxk= ) ; Key
                   ID = 4459
                   com. 86400 IN DNSKEY ( 256 3 8 AwEAAcbxnScZaHfDT9aepsoUJgaaVLBPtxmQ7W/
                   yj3Vmnn6JNaCJ/Z3cTrpmw1f3xlH127F1Zoe3
                  bMO18wOfsI26I9k4GTMIo3FtODyQud7c52nS4gHOaeiuncejfokqg79cGr7AUNCtZVrAW74eshI3
                   3py92W1sCkAm/rSsgygyWNYrsM8f8DLoMHaXngn9RhSKkehMFiLMCoBUvsVfvFRlJh8= ) ; Key
com                ID = 63246
                   com. 86400 IN DNSKEY ( 257 3 8 AQPDzldNmMvZFX4NcNJ0uEnKDg7tmv/
                   F3MyQR0lpBmVcNcsIszxNFxsBfKNW9JYCYqpik8366LE7
                  VbIcNRzfp2h9OO8HRl+H+E08zauK8k7evWEmu/6od+2boggPoiEfGNyvNPaSI7FOIroDsnw/tagg
                   zHRX1Z7SOiOiPWPNIwSUyWOZ79VmcQ1GLkC6NlYvG3HwYmynQv6oFwGv/KELSw7ZSdrbTQ0HXvZb
                   qMUI7BaMskmvgm1G7oKZ1YiF7O9ioVNc0+7ASbqmZN7Z98EGU/Qh2K/BgUe8Hs0XVcdPKrtyYnoQ
                   Hd2ynKPcMMlTEih2/2HDHjRPJ2aywIpKNnv4oPo/ ) ; Key ID = 30909
                  DNSKEY=30909/SEP is now in the chain-of-trust
        [/         DS=30909/SHA-256 verifies DNSKEY=30909/SEP
        green.png]
        [/         Found 1 RRSIGs over DNSKEY RRset
        green.png]
                   com. 86400 IN RRSIG ( DNSKEY 8 1 86400 20231022172421 20231007171921 30909
                   com.
                   mrHSedgJrevEtCjO50iuiW7hf7xmuO8R1EJ+88DeGoBkMZelnwuu4OilTpdqX0Crq5M4J8PqvVal
                  WKB1/rLZH9PzznaY3+od+XwuqHgFsGrxMSzfWHqQj56Klq6IscDjddXCmhWOMlMJ2PJVPV9JqfG+
                   VnZFw+LYt6UyNU30vWidklZ1JBVofPU3PNqajyFnDpWlAXr0GW5qnFI6uHxrZdLgGPfMCq54tjJc
                   7ZQntVupPdoK8RcOxmPnpSO2GFxDSdv5Yjha8tG+TjoA25o+NjGKcTalnQeHyrR9pLHb64Fw9IL6
                   450Z1OWxmQ4jHhvqCy0rOzfOj39UpGGi5bFSCw== )
        [/         RRSIG=30909 and DNSKEY=30909/SEP verifies the DNSKEY RRset
        green.png]
                  DNSKEY=4459 is now in the chain-of-trust
                  DNSKEY=63246 is now in the chain-of-trust
                  Query to e.gtld-servers.net for cnn.com/A
                  Received 737 bytes from 192.12.94.30
                   ;; Response received from 192.12.94.30 (737 octets)
                   ;; HEADER SECTION
                   ;;   id = 24228
                   ;;   qr = 1  aa = 0  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 0  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 0     nscount = 8     arcount = 2
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                   ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      A

                   ;; ANSWER SECTION (0 records)

                   ;; AUTHORITY SECTION (8 records)
                   cnn.com.     172800  IN      NS      ns-47.awsdns-05.com.
                   cnn.com.     172800  IN      NS      ns-576.awsdns-08.net.
                   cnn.com.     172800  IN      NS      ns-1630.awsdns-11.co.uk.
                  cnn.com.      172800  IN      NS      ns-1086.awsdns-07.org.
                   CK0POJMG874LJREF7EFN8430QVIT8BSM.com.        86400   IN      NSEC3   ( 1 1 0 -
                        ck0q2d6ni4i7eqh8na30ns61o48ul8g5 NS SOA RRSIG DNSKEY NSEC3PARAM )
                   CK0POJMG874LJREF7EFN8430QVIT8BSM.com.        86400   IN      RRSIG   ( NSEC3 8 2 86400
                        20231017042434 20231010031434 4459 com.
                        V9R5cPiW0csaGo80WLgWLMRzzNWmgdCLtjQQgqFhdIVfiwL9rWGQ+aXvA9nZFcVPRjnIGv53aedp
                        +ViOz6ShDkvuirXqhBnrfXOhI10XaOtneDaAzyIetPQM1iqk4SHSZF5vTX5omBj7eXIEi3dhSDxQ
                        FZXGNbrMfAHhCHOoy1mKw52VsIdchh13vvuy+M0MuAqo62r++BOpcvaoo9gXzQ== )
                   FVT7CCDTGI7OTUC4C3FVJ0OMD1D59FP7.com.        86400   IN      NSEC3   ( 1 1 0 -
                        fvt7k43dj0k7kj384m71us54d3690vui NS DS RRSIG )
                   FVT7CCDTGI7OTUC4C3FVJ0OMD1D59FP7.com.        86400   IN      RRSIG   ( NSEC3 8 2 86400
                        20231015044058 20231008033058 4459 com.
                        TqMYQCCKVnTGp7tC+5Kk7XHrmEIR7wlTn7KjRQbd0WP4XLuCuqOnevRA3HMwQ1vdDdzrTNdMjSCd
                        MDLCdNWHqXdmAbxV/O5cmcsnqdxrSSmu7biLE+lCQA+/oX0FjcbxwB2ojpwX1X9o1jrVJKfwSuht
                        WBHlbP1os8GI1K8rpYrBYZcOAQHy7NXL0oh1S537oedgGEyhKKzBp7J4XL4p3g== )

                   ;; ADDITIONAL SECTION (2 records)
                   ns-47.awsdns-05.com. 172800  IN      A       205.251.192.47
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                  Query to d.gtld-servers.net for cnn.com/DNSKEY
                  Received 737 bytes from 192.31.80.30
                   ;; Response received from 192.31.80.30 (737 octets)
                   ;; HEADER SECTION
                   ;;   id = 12123
                   ;;   qr = 1  aa = 0  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 0  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 0     nscount = 8     arcount = 2
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                   ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      DNSKEY

                   ;; ANSWER SECTION (0 records)

                   ;; AUTHORITY SECTION (8 records)
                   cnn.com.     172800  IN      NS      ns-47.awsdns-05.com.
                   cnn.com.     172800  IN      NS      ns-576.awsdns-08.net.
                   cnn.com.     172800  IN      NS      ns-1630.awsdns-11.co.uk.
                  cnn.com.      172800  IN      NS      ns-1086.awsdns-07.org.
                   CK0POJMG874LJREF7EFN8430QVIT8BSM.com.        86400   IN      NSEC3   ( 1 1 0 -
                        ck0q2d6ni4i7eqh8na30ns61o48ul8g5 NS SOA RRSIG DNSKEY NSEC3PARAM )
                   CK0POJMG874LJREF7EFN8430QVIT8BSM.com.        86400   IN      RRSIG   ( NSEC3 8 2 86400
                        20231017042434 20231010031434 4459 com.
                        V9R5cPiW0csaGo80WLgWLMRzzNWmgdCLtjQQgqFhdIVfiwL9rWGQ+aXvA9nZFcVPRjnIGv53aedp
                        +ViOz6ShDkvuirXqhBnrfXOhI10XaOtneDaAzyIetPQM1iqk4SHSZF5vTX5omBj7eXIEi3dhSDxQ
                        FZXGNbrMfAHhCHOoy1mKw52VsIdchh13vvuy+M0MuAqo62r++BOpcvaoo9gXzQ== )
                   FVT7CCDTGI7OTUC4C3FVJ0OMD1D59FP7.com.        86400   IN      NSEC3   ( 1 1 0 -
                        fvt7k43dj0k7kj384m71us54d3690vui NS DS RRSIG )
                   FVT7CCDTGI7OTUC4C3FVJ0OMD1D59FP7.com.        86400   IN      RRSIG   ( NSEC3 8 2 86400
                        20231015044058 20231008033058 4459 com.
                        TqMYQCCKVnTGp7tC+5Kk7XHrmEIR7wlTn7KjRQbd0WP4XLuCuqOnevRA3HMwQ1vdDdzrTNdMjSCd
                        MDLCdNWHqXdmAbxV/O5cmcsnqdxrSSmu7biLE+lCQA+/oX0FjcbxwB2ojpwX1X9o1jrVJKfwSuht
                        WBHlbP1os8GI1K8rpYrBYZcOAQHy7NXL0oh1S537oedgGEyhKKzBp7J4XL4p3g== )

                   ;; ADDITIONAL SECTION (2 records)
                   ns-47.awsdns-05.com. 172800  IN      A       205.251.192.47
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                  Found child zone cnn.com
                  Checking DS between com and cnn.com
                  Query to m.gtld-servers.net for cnn.com/DS
                  Received 853 bytes from 192.55.83.30
                   ;; Response received from 192.55.83.30 (853 octets)
                   ;; HEADER SECTION
                   ;;   id = 23232
                   ;;   qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 0  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 0     nscount = 6     arcount = 1
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                   ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      DS

                   ;; ANSWER SECTION (0 records)

                   ;; AUTHORITY SECTION (6 records)
                   CK0POJMG874LJREF7EFN8430QVIT8BSM.com.        86400   IN      NSEC3   ( 1 1 0 -
                        ck0q2d6ni4i7eqh8na30ns61o48ul8g5 NS SOA RRSIG DNSKEY NSEC3PARAM )
                   CK0POJMG874LJREF7EFN8430QVIT8BSM.com.        86400   IN      RRSIG   ( NSEC3 8 2 86400
                        20231017042434 20231010031434 4459 com.
                        V9R5cPiW0csaGo80WLgWLMRzzNWmgdCLtjQQgqFhdIVfiwL9rWGQ+aXvA9nZFcVPRjnIGv53aedp
                        +ViOz6ShDkvuirXqhBnrfXOhI10XaOtneDaAzyIetPQM1iqk4SHSZF5vTX5omBj7eXIEi3dhSDxQ
                        FZXGNbrMfAHhCHOoy1mKw52VsIdchh13vvuy+M0MuAqo62r++BOpcvaoo9gXzQ== )
                   com. 900     IN      SOA     ( a.gtld-servers.net. nstld.verisign-grs.com.
                                                1696994652      ;serial
                                                1800            ;refresh
                                                900             ;retry
                                                604800          ;expire
                                                86400           ;minimum
                        )
                   com. 900     IN      RRSIG   ( SOA 8 1 900 20231018032412 20231011021412 4459 com.
                        Ez6a9hHoBCit8xH9OGv782RPSMaog4DZSOxjrmnwlJOzM5SDjrRqqDJiYJSMBg8NcVu9ulazLslt
                        rzpOmBSqCcqVYmW6a/NTX1+qySINbxiOWXSSvfsRscbotzXjy9RLGw0+Fk0wbZ20mIfdOAaJjKSS
                        RB36aLwXYDPMvGy7UBqohliskjjBagEASEGL1AxiexubbbpAyDRdnUv9oPuIMw== )
                   FVT7CCDTGI7OTUC4C3FVJ0OMD1D59FP7.com.        86400   IN      NSEC3   ( 1 1 0 -
                        fvt7k43dj0k7kj384m71us54d3690vui NS DS RRSIG )
                   FVT7CCDTGI7OTUC4C3FVJ0OMD1D59FP7.com.        86400   IN      RRSIG   ( NSEC3 8 2 86400
                        20231015044058 20231008033058 4459 com.
                        TqMYQCCKVnTGp7tC+5Kk7XHrmEIR7wlTn7KjRQbd0WP4XLuCuqOnevRA3HMwQ1vdDdzrTNdMjSCd
                        MDLCdNWHqXdmAbxV/O5cmcsnqdxrSSmu7biLE+lCQA+/oX0FjcbxwB2ojpwX1X9o1jrVJKfwSuht
                        WBHlbP1os8GI1K8rpYrBYZcOAQHy7NXL0oh1S537oedgGEyhKKzBp7J4XL4p3g== )

                   ;; ADDITIONAL SECTION (1 record)
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

        [/red.png] No DS records found for cnn.com in the com zone
                  Query to ns-47.awsdns-05.com for cnn.com/DNSKEY
                  Received 113 bytes from 205.251.192.47
                   ;; Response received from 205.251.192.47 (113 octets)
                   ;; HEADER SECTION
                   ;;   id = 60060
                   ;;   qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 0     nscount = 1     arcount = 1
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                   ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      DNSKEY

                  ;; ANSWER SECTION (0 records)

                   ;; AUTHORITY SECTION (1 record)
                   cnn.com.     900     IN      SOA     ( ns-47.awsdns-05.com. awsdns-hostmaster.amazon.com.
                                                1               ;serial
                                                7200            ;refresh
                                                900             ;retry
                                                1209600         ;expire
                                                86400           ;minimum
                        )

                   ;; ADDITIONAL SECTION (1 record)
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

        [/red.png] No DNSKEY records found
                  Query to ns-576.awsdns-08.net for cnn.com/A
                  Received 236 bytes from 205.251.194.64
                   ;; Response received from 205.251.194.64 (236 octets)
                   ;; HEADER SECTION
                   ;;   id = 56284
                   ;;   qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 4     nscount = 4     arcount = 1
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                   ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      A

                   ;; ANSWER SECTION (4 records)
                  cnn.com.      60      IN      A       151.101.67.5
                   cnn.com.     60      IN      A       151.101.131.5
                   cnn.com.     60      IN      A       151.101.195.5
                   cnn.com.     60      IN      A       151.101.3.5

                   ;; AUTHORITY SECTION (4 records)
                   cnn.com.     3600    IN      NS      ns-1086.awsdns-07.org.
                   cnn.com.     3600    IN      NS      ns-1630.awsdns-11.co.uk.
                   cnn.com.     3600    IN      NS      ns-47.awsdns-05.com.
                   cnn.com.     3600    IN      NS      ns-576.awsdns-08.net.

                   ;; ADDITIONAL SECTION (1 record)
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

        [/         ns-576.awsdns-08.net is authoritative for cnn.com
        green.png]
                  Query to ns-1086.awsdns-07.org for cnn.com/SOA
                  Received 233 bytes from 205.251.196.62
                   ;; Response received from 205.251.196.62 (233 octets)
                   ;; HEADER SECTION
                   ;;   id = 58714
                   ;;   qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 1     nscount = 4     arcount = 1
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

cnn.com            ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      SOA

                   ;; ANSWER SECTION (1 record)
                   cnn.com.     900     IN      SOA     ( ns-47.awsdns-05.com. awsdns-hostmaster.amazon.com.
                                                1               ;serial
                                                7200            ;refresh
                                                900             ;retry
                                                1209600         ;expire
                                                86400           ;minimum
                        )

                   ;; AUTHORITY SECTION (4 records)
                   cnn.com.     3600    IN      NS      ns-1086.awsdns-07.org.
                   cnn.com.     3600    IN      NS      ns-1630.awsdns-11.co.uk.
                   cnn.com.     3600    IN      NS      ns-47.awsdns-05.com.
                   cnn.com.     3600    IN      NS      ns-576.awsdns-08.net.

                   ;; ADDITIONAL SECTION (1 record)
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                  Query to ns-1630.awsdns-11.co.uk for cnn.com/SOA
                  Received 233 bytes from 205.251.198.94
                   ;; Response received from 205.251.198.94 (233 octets)
                   ;; HEADER SECTION
                   ;;   id = 45391
                   ;;   qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 1     nscount = 4     arcount = 1
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                   ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      SOA

                   ;; ANSWER SECTION (1 record)
                   cnn.com.     900     IN      SOA     ( ns-47.awsdns-05.com. awsdns-hostmaster.amazon.com.
                                                1               ;serial
                                                7200            ;refresh
                                                900             ;retry
                                                1209600         ;expire
                                                86400           ;minimum
                        )

                   ;; AUTHORITY SECTION (4 records)
                   cnn.com.     3600    IN      NS      ns-1086.awsdns-07.org.
                   cnn.com.     3600    IN      NS      ns-1630.awsdns-11.co.uk.
                   cnn.com.     3600    IN      NS      ns-47.awsdns-05.com.
                   cnn.com.     3600    IN      NS      ns-576.awsdns-08.net.

                   ;; ADDITIONAL SECTION (1 record)
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                  Query to ns-47.awsdns-05.com for cnn.com/SOA
                  Received 233 bytes from 205.251.192.47
                   ;; Response received from 205.251.192.47 (233 octets)
                   ;; HEADER SECTION
                   ;;   id = 7456
                   ;;   qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 1     nscount = 4     arcount = 1
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                   ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      SOA

                   ;; ANSWER SECTION (1 record)
                   cnn.com.     900     IN      SOA     ( ns-47.awsdns-05.com. awsdns-hostmaster.amazon.com.
                                                1               ;serial
                                                7200            ;refresh
                                                900             ;retry
                                                1209600         ;expire
                                                86400           ;minimum
                        )

                   ;; AUTHORITY SECTION (4 records)
                   cnn.com.     3600    IN      NS      ns-1086.awsdns-07.org.
                   cnn.com.     3600    IN      NS      ns-1630.awsdns-11.co.uk.
                   cnn.com.     3600    IN      NS      ns-47.awsdns-05.com.
                   cnn.com.     3600    IN      NS      ns-576.awsdns-08.net.

                   ;; ADDITIONAL SECTION (1 record)
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                  Query to ns-576.awsdns-08.net for cnn.com/A
                  Received 236 bytes from 205.251.194.64
                   ;; Response received from 205.251.194.64 (236 octets)
                   ;; HEADER SECTION
                   ;;   id = 62339
                   ;;   qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                   ;;   ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                   ;;   qdcount = 1     ancount = 4     nscount = 4     arcount = 1
                   ;;   do = 1
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

                   ;; QUESTION SECTION (1 record)
                   ;; cnn.com.  IN      A

                   ;; ANSWER SECTION (4 records)
                  cnn.com.      60      IN      A       151.101.67.5
                   cnn.com.     60      IN      A       151.101.195.5
                   cnn.com.     60      IN      A       151.101.131.5
                   cnn.com.     60      IN      A       151.101.3.5

                   ;; AUTHORITY SECTION (4 records)
                   cnn.com.     3600    IN      NS      ns-1086.awsdns-07.org.
                   cnn.com.     3600    IN      NS      ns-1630.awsdns-11.co.uk.
                   cnn.com.     3600    IN      NS      ns-47.awsdns-05.com.
                   cnn.com.     3600    IN      NS      ns-576.awsdns-08.net.

                   ;; ADDITIONAL SECTION (1 record)
                   ;; EDNS version 0
                   ;;   flags:  8000
                   ;;   rcode:  NOERROR
                   ;;   size:   4096
                   ;;   option:

        [/         cnn.com A RR has value 151.101.67.5
        green.png]
                  cnn.com A RR has value 151.101.195.5
                  cnn.com A RR has value 151.101.131.5
                  cnn.com A RR has value 151.101.3.5
        [/red.png] No RRSIGs found
                    Query to ns-47.awsdns-05.com for cnn.com/A
                    Received 236 bytes from 205.251.192.47
                     ;; Response received from 205.251.192.47 (236 octets)
                     ;; HEADER SECTION
                     ;; id = 23129
                     ;; qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                     ;; ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                     ;; qdcount = 1     ancount = 4     nscount = 4     arcount = 1
                     ;; do = 1
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

                     ;; QUESTION SECTION (1 record)
                     ;; cnn.com.        IN      A

                     ;; ANSWER SECTION (4 records)
                    cnn.com.    60      IN      A       151.101.195.5
                     cnn.com.   60      IN      A       151.101.131.5
                     cnn.com.   60      IN      A       151.101.3.5
                     cnn.com.   60      IN      A       151.101.67.5

                     ;; AUTHORITY SECTION (4 records)
                     cnn.com.   3600    IN      NS      ns-1086.awsdns-07.org.
                     cnn.com.   3600    IN      NS      ns-1630.awsdns-11.co.uk.
                     cnn.com.   3600    IN      NS      ns-47.awsdns-05.com.
                     cnn.com.   3600    IN      NS      ns-576.awsdns-08.net.

                     ;; ADDITIONAL SECTION (1 record)
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

        [/green.png] ns-47.awsdns-05.com is authoritative for cnn.com
                    Query to ns-47.awsdns-05.com for cnn.com/A
cnn.com             Received 236 bytes from 205.251.192.47
                     ;; Response received from 205.251.192.47 (236 octets)
                     ;; HEADER SECTION
                     ;; id = 38327
                     ;; qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                     ;; ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                     ;; qdcount = 1     ancount = 4     nscount = 4     arcount = 1
                     ;; do = 1
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

                     ;; QUESTION SECTION (1 record)
                     ;; cnn.com.        IN      A

                     ;; ANSWER SECTION (4 records)
                    cnn.com.    60      IN      A       151.101.131.5
                     cnn.com.   60      IN      A       151.101.3.5
                     cnn.com.   60      IN      A       151.101.67.5
                     cnn.com.   60      IN      A       151.101.195.5

                     ;; AUTHORITY SECTION (4 records)
                     cnn.com.   3600    IN      NS      ns-1086.awsdns-07.org.
                     cnn.com.   3600    IN      NS      ns-1630.awsdns-11.co.uk.
                     cnn.com.   3600    IN      NS      ns-47.awsdns-05.com.
                     cnn.com.   3600    IN      NS      ns-576.awsdns-08.net.

                     ;; ADDITIONAL SECTION (1 record)
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

        [/green.png] cnn.com A RR has value 151.101.131.5
                    cnn.com A RR has value 151.101.3.5
                    cnn.com A RR has value 151.101.67.5
                    cnn.com A RR has value 151.101.195.5
        [/red.png]   No RRSIGs found
                    Query to ns-1630.awsdns-11.co.uk for cnn.com/A
                    Received 236 bytes from 205.251.198.94
                     ;; Response received from 205.251.198.94 (236 octets)
                     ;; HEADER SECTION
                     ;; id = 42414
                     ;; qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                     ;; ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                     ;; qdcount = 1     ancount = 4     nscount = 4     arcount = 1
                     ;; do = 1
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

                     ;; QUESTION SECTION (1 record)
                     ;; cnn.com.        IN      A

                     ;; ANSWER SECTION (4 records)
                    cnn.com.    60      IN      A       151.101.131.5
                     cnn.com.   60      IN      A       151.101.67.5
                     cnn.com.   60      IN      A       151.101.195.5
                     cnn.com.   60      IN      A       151.101.3.5

                     ;; AUTHORITY SECTION (4 records)
                     cnn.com.   3600    IN      NS      ns-1086.awsdns-07.org.
                     cnn.com.   3600    IN      NS      ns-1630.awsdns-11.co.uk.
                     cnn.com.   3600    IN      NS      ns-47.awsdns-05.com.
                     cnn.com.   3600    IN      NS      ns-576.awsdns-08.net.

                     ;; ADDITIONAL SECTION (1 record)
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

        [/green.png] ns-1630.awsdns-11.co.uk is authoritative for cnn.com
                    Query to ns-1630.awsdns-11.co.uk for cnn.com/A
cnn.com             Received 236 bytes from 205.251.198.94
                     ;; Response received from 205.251.198.94 (236 octets)
                     ;; HEADER SECTION
                     ;; id = 15082
                     ;; qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                     ;; ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                     ;; qdcount = 1     ancount = 4     nscount = 4     arcount = 1
                     ;; do = 1
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

                     ;; QUESTION SECTION (1 record)
                     ;; cnn.com.        IN      A

                     ;; ANSWER SECTION (4 records)
                    cnn.com.    60      IN      A       151.101.195.5
                     cnn.com.   60      IN      A       151.101.67.5
                     cnn.com.   60      IN      A       151.101.3.5
                     cnn.com.   60      IN      A       151.101.131.5

                     ;; AUTHORITY SECTION (4 records)
                     cnn.com.   3600    IN      NS      ns-1086.awsdns-07.org.
                     cnn.com.   3600    IN      NS      ns-1630.awsdns-11.co.uk.
                     cnn.com.   3600    IN      NS      ns-47.awsdns-05.com.
                     cnn.com.   3600    IN      NS      ns-576.awsdns-08.net.

                     ;; ADDITIONAL SECTION (1 record)
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

        [/green.png] cnn.com A RR has value 151.101.195.5
                    cnn.com A RR has value 151.101.67.5
                    cnn.com A RR has value 151.101.3.5
                    cnn.com A RR has value 151.101.131.5
        [/red.png]   No RRSIGs found
                    Query to ns-1086.awsdns-07.org for cnn.com/A
                    Received 236 bytes from 205.251.196.62
                     ;; Response received from 205.251.196.62 (236 octets)
                     ;; HEADER SECTION
                     ;; id = 1783
                     ;; qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                     ;; ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                     ;; qdcount = 1     ancount = 4     nscount = 4     arcount = 1
                     ;; do = 1
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

                     ;; QUESTION SECTION (1 record)
                     ;; cnn.com.        IN      A

                     ;; ANSWER SECTION (4 records)
                    cnn.com.    60      IN      A       151.101.3.5
                     cnn.com.   60      IN      A       151.101.131.5
                     cnn.com.   60      IN      A       151.101.195.5
                     cnn.com.   60      IN      A       151.101.67.5

                     ;; AUTHORITY SECTION (4 records)
                     cnn.com.   3600    IN      NS      ns-1086.awsdns-07.org.
                     cnn.com.   3600    IN      NS      ns-1630.awsdns-11.co.uk.
                     cnn.com.   3600    IN      NS      ns-47.awsdns-05.com.
                     cnn.com.   3600    IN      NS      ns-576.awsdns-08.net.

                     ;; ADDITIONAL SECTION (1 record)
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

        [/green.png] ns-1086.awsdns-07.org is authoritative for cnn.com
                    Query to ns-1086.awsdns-07.org for cnn.com/A
cnn.com             Received 236 bytes from 205.251.196.62
                     ;; Response received from 205.251.196.62 (236 octets)
                     ;; HEADER SECTION
                     ;; id = 47188
                     ;; qr = 1  aa = 1  tc = 0  rd = 0  opcode = QUERY
                     ;; ra = 0  z  = 0  ad = 1  cd = 0  rcode  = NOERROR
                     ;; qdcount = 1     ancount = 4     nscount = 4     arcount = 1
                     ;; do = 1
                     ;; EDNS version 0
                     ;; flags:  8000
                     ;; rcode:  NOERROR
                     ;; size:   4096
                     ;; option:

                     ;; QUESTION SECTION (1 record)
                     ;; cnn.com.        IN      A

                     ;; ANSWER SECTION (4 records)

