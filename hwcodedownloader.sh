#!/bin/bash
# this script can now automatically process most of the highway code website
# the introduction is a special case
wget -O - https://www.gov.uk/highway-code/introduction/print | hxclean | xml2asc | hxremove footer | hxremove aside | hxremove .meta-data | hxremove .print-link | hxselect main | sed -e 's/<main/<section/g' -e 's/<\/main/<\/section/g' -e 's/2\. //g' > downloadedhwcode.html
# the rest is all in one file
while read url; do
    wget --wait 2 --random-wait -O - "$url" | xml2asc | hxnormalize -x | hxclean | hxremove .meta-data | hxremove .report-a-problem-container | hxextract main - | sed -e 's/<main/\n<section/g' -e 's/<\/main/<\/section/g' -e 's/<br/<br\//g'| hxnormalize -x >> downloadedhwcode.html; done < urlslist.txt
