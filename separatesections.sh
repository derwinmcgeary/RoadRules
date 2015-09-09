#!/bin/bash
# self-explanatory script, extract all articles from the code, split into separate files
cat hwcode/hwcode.html | hxextract article - | sed -e 's/\/article>/\/article>\n/g' | csplit -z - /"article>"/+1 {*} 
mv xx* hwcode/
# and rename the files according to the id="" in the first line of all of them
cd hwcode
for file in xx*
do
    mv $file `head -q -n 1 $file | sed -e 's/^.*id="//g' -e 's/".*/.html/g'`
done
cd ..
