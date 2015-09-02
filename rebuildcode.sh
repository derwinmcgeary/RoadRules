#!/bin/bash
rm hwcode.html downloadedhwcode.html
./hwcodedownloader.sh
cat htmlpreamble.html downloadedhwcode.html htmlcoda.html | awk -f duplicateremover.awk  > hwcode.html
cat hwcode.html | grep src | sed -e 's/src="//g' -e 's/"$//g' | wget -i - -P images
sed -i -e 's/https:\/\/assets.digital.cabinet-office.gov.uk\/static\/hc/images/g' hwcode.html
