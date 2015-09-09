#!/bin/bash
rm hwcode/hwcode.html downloadedhwcode.html
./hwcodedownloader.sh
cat htmlpreamble.html downloadedhwcode.html htmlcoda.html | awk -f duplicateremover.awk  > hwcode.html
cat hwcode.html | grep src | sed -e 's/src="//g' -e 's/"$//g' | wget -nc -i - -P hwcode
rm downloadedhwcode.html
# rule 252 has too long a filename for android, apparently, so...
mv hwcode/hc_rule_252* hwcode/hc_rule_252.jpg
sed -i -e 's/https:\/\/assets.digital.cabinet-office.gov.uk\/static\/hc\///g' -e 's/rule_252.*jpg/rule_252.jpg/g' hwcode.html
sed -i -e 's/height=".*"//g' -e 's/width=".*"/width="100%"/g' hwcode.html
mv hwcode.html hwcode/
./separatesections.sh
