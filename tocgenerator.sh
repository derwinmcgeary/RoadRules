#!/bin/bash
# this will generate a file called toc.html with <a> links from the ids of <section> tags
# extract the X from all the id="XXXX" in <section > tags and put in lowcase.txt
cat $1 | sed 's/>/>\n/g' | grep \<section\ | sed -e 's/<section id=\"//g' -e 's/\">//g' -e 's/\".*//g' | sed -r -e 's/^\s*//g' > lowcase.txt
# Change lowcase-things-like-this to Headline Case with Brackets Around Numbers (1 to 10)
cat lowcase.txt | sed 's/-/ /g' | sed -r 's/\w+/\u&/g' | sed -e 's/To /to /g' -e 's/For /for /g' -e 's/And /and /g' -e 's/At /at /g' -e 's/In /in /g' -e 's/ The / the /g' -e 's/Of /of /g' | sed -r -e 's/[0-9]/\(&/1' -e 's/[0-9]$/&\)/g' > toc.txt
# Change lowcase.txt to <a href="low-some-aesdf">
cat lowcase.txt | sed -r -e 's/^/<a href=\"\#/g' | sed -e 's/$/\">/g' > starttox.html
# add </a> to the sentence case stuff
cat toc.txt | sed -r -e 's/^\s*//g'| sed -e 's/$/<\/a>/' > endtox.html
# and join them like a zipper
paste -d '' starttox.html endtox.html > toc.html
