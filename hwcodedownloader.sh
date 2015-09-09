#!/bin/bash
# this script can now automatically process most of the highway code website
# the introduction is a special case
wget -O - https://www.gov.uk/highway-code/print | hxclean | hxnormalize -x | xml2asc| hxselect article#introduction > downloadedhwcode.html
# wget -O - https://www.gov.uk/highway-code/introduction/print | hxclean | xml2asc | hxremove footer | hxremove aside | hxremove .meta-data | hxremove .print-link | hxselect main | sed -e 's/<main/<section/g' -e 's/<\/main/<\/section/g' -e 's/2\. //g' -e 's/\/using-the-road-159-to-203\/the-road-user-and-the-law/\#the-road-user-and-the-law/g' > downloadedhwcode.html
# the rest is all in one file
while read url; do
    wget --wait 2 --random-wait -O - "$url" | xml2asc | hxclean | hxnormalize -x | hxremove .meta-data | hxremove .report-a-problem-container | hxextract main - | sed -e 's/<main/\n<section/g' -e 's/<\/main/<\/section/g' | hxnormalize -x >> downloadedhwcode.html; done < urlslist.txt
