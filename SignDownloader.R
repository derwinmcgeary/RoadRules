### This script downloads and unzips all eps file for UK road signs from the official government site
### it also downloads an Excel file which describes and categorises them, as "signs.xls"
### Download all the files from HERE
myurl <- "https://www.gov.uk/traffic-sign-images"
basedomain <- "https://www.gov.uk"
xlfile <- "signs.xls"

library(XML)
library(downloader)
library(RCurl)

doc.html <- getURL(myurl,.opts = list(ssl.verifypeer = FALSE) )
doc.html <- readLines(tc <- textConnection(doc.html)); close(tc)
prsd <- htmlParse(doc.html)
links <- xpathSApply(prsd, "//a/@href")
links <- as.vector(links)
xlsheet <- links[grepl(".xls", links)]
links <- links[grepl("eps.zip",links)]
links <- paste(basedomain,links,sep="")
xlsheet <- paste(basedomain,xlsheet,sep="")
download(xlsheet,xlfile)
data <- strsplit(links,"\\/","[[",1)
dat <- data.frame(data)
dat <- t(dat)
dat <- data.frame(dat)
filenames <- as.character(dat$X11)

for(i in 1:length(links)) {
  if(!file.exists(filenames[i])){
    download(links[i],filenames[i])
    Sys.sleep(3)
  }
}
for(fn in filenames){
unzip(fn)
  }
