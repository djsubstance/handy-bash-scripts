Filename: .bashrc
Location: place in  ~ if you are running bash as that user
Author: substance
created: 02/23
last mod: 04/24

# This can be pasted in below your current .bashrc:

 extract_urls() {     egrep -o '(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]*[-A-Za-z0-9+&@#/%=~_|]' "$@"; }
# Usage (example)
bash$ cat ~/txt/*.txt | extract_url
 http://www.tdcanadatrust.com/products-services/banking/credit-cards/credit-cards.jsp
 http://www.cwbank.com/credit-cards
 http://www.rbc.com/avion
 http://www.rbcroyalbank.com/credit-cards/travel-credit-cards/british-airways-credit-card.html
 https://www.rbcroyalbank.com/business/credit-cards/small-business-credit-cards/avion-visa-infinite-business.html
 https://www.vancity.com/bank/credit-cards/enviro-infinite/
 https://www.vancity.com/bank/credit-cards/enviro-visa-infinite-business/
 http://www.scotiabank.com/ca/en/0%2C%2C86%2C00.html 

 ----------
 alias qq=" tr ';' '\n' | tr ',' '\n'| more"
# Usage and history 
 # I ran out of letter combos, what this does, is . if jq / json_pp isnt cutting it then try adding this alias then:

 bash$ cat crazy.js
 #--- [ BEFORE ] ----
 7323000],2,false,null,false,null,[873251149951,273627735,387640615,null,"RM1DD92364"],false,false,false,""]],[[1077762947798,null,null,["Polly","Drive meaningful connection with your team in every meeting. Polly makes it simple to engage, empower, and entertain your meeting attendees, instantly","Drive meaningful connection with your team in every meeting. Polly makes it simple to engage, empower, and entertain your meeting attendees, instantly. ","https://lh3.googleusercontent.com/-RYMoSjofX0E/ZU1yXJTLi0I/AAAAAAAACi4/xcjvKb4KLtQY0I0o9tBW3WkFjvao-UGZwCNcBGAsYHQ/s400/Polly-brand-icon-transparent-128x128.png","https://lh3.googleusercontent.com/-UABOMJnZeXM/ZU1yYkETrRI/AAAAAAAACjA/A4i3E2W8mbMaLeiNx90pEAvtXopkbGRNACNcBGAsYHQ/s220-w220-h140-nd/polly-marketplace-banner-220x140.png","polly",[["https://lh3.googleusercontent.com/-M8Tcyo3Av1o/ZU1yahiUmGI/AAAAAAAACjI/vQStwpGzRTMhuA2y2RuuYCTlB4pU7wdIACNcBGAsYHQ/s640-w640-h400/img%2B1.png",1],["https://lh3.googleusercontent.com/-rmB_q4rB1nY/ZU1yb96YkjI/AAAAAAAACjQ/p7obWcEF4VMPhbntkEn5KkVqWV6vGNbJwCNcBGAsYHQ/s640-w640-h400/img%2B2.png",1],["https://lh3.googleusercontent.com/-jQ0UfLL3wwU/ZU1ydijkCrI/AAAAAAAACjY/NahDLVfEOW8DIvVk7tNS0eLnUmAm5az-wCNcBGAsYHQ/s640-w640-h400/Img%2B3.png",1]]],["Polly","https://www.polly.ai",1,"support@polly.ai"],[10,2.6,"746K+",746461],null,null,["","https://www.polly.ai/terms-of-service","https://www.polly.ai/privacy","https://ww
 
# This is crap to look at.. try my alias:
 bash$ cat crazy.js | qq
 
 Description"></span>Drive meaningful connection with your team in every meeting. Polly makes it simple to engage
 empower
 and entertain your meeting attendees
 instantly</div></div><span class="GDSAjf"><span class="kVdtk"><svg enable-background="new 0 0 24 24" height="12" viewBox="0 0 24 24" width="12" focusable="false" class=" NMm5M"><g><polygon points="14.43
10 12
2 9.57
10 2
10 8.18
14.41 5.83
22 12
17.31 18.18
22 15.83
14.41 22
10"/><rect fill="none" height="24" width="24" x="0"/></g></svg><span aria-label="
 Rating"></span><span class="wUhZA" aria-description="
 Rating">2.6</span></span><span class="kVdtk"><svg width="14" height="14" viewBox="0 0 24 24" focusable="false" class=" NMm5M"><path d="M18 15v3H6v-3H4v3c0 
 (yea its a little better)
 
 Note: Its not perfect, but hitting \n on ; and , 
 
 
 ---------


 Summary again without explaining:
 
