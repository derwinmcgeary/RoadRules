#!/bin/bash
# this script can now automatically process most of the highway code website
# the introduction is a special case
wget -O - https://www.gov.uk/highway-code/introduction/print | hxclean | xml2asc | hxremove footer | hxremove aside | hxremove .meta-data | hxremove .print-link | hxselect main | sed -e 's/<main/<section/g' -e 's/<\/main/<\/section/g' -e 's/2\. //g' > downloadedhwcode.html
# the rest is all in one file
while read url; do
    wget --wait 2 --random-wait -O - "$url" | xml2asc | hxnormalize | hxextract article - | sed -e 's/<article/\n<section/g' -e 's/<\/article/<\/section/g' | sed -n '/class=\"meta-data\ group\"/q;p' >> downloadedhwcode.html; done < urlslist.txt
