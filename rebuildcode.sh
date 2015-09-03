#!/bin/bash
rm hwcode.html downloadedhwcode.html
./hwcodedownloader.sh
cat htmlpreamble.html downloadedhwcode.html htmlcoda.html | awk -f duplicateremover.awk  > hwcode.html
cat hwcode.html | grep src | sed -e 's/src="//g' -e 's/"$//g' | wget -nc -i - -P images
mv hc_rule_252* rule_252.jpg
sed -i -e 's/https:\/\/assets.digital.cabinet-office.gov.uk\/static\/hc\///g' -e 's/rule_252.*jpg/rule_252.jpg/g' hwcode.html
