#getting the page content
con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
#htmlCode = readLines(con)
close(con)

#parse using XML librairies
#library(XML) ##load only once
url <- "http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(url, useInternalNodes=T)
xpathSApply(html, "//title", xmlValue)

#GET from the httr package
#library(httr) ##load only once
html2 = GET(url)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)