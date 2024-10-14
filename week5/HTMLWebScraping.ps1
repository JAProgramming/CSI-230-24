$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.42/ToBeScraped.html
#$scraped_page.links.count

#$scraped_page.links

#$scraped_page.Links | Select-Object outerText, href

#$hs1=$scraped_page.Parsedhtml.body.getElementsByTagName("h2") | select outerText
#$hs1

$divs1=$scraped_page.Parsedhtml.body.getElementsByTagName("div") | where {
$_.getAttributeNode("class").Value -ilike "*div-1"} | select innerText
$divs1

