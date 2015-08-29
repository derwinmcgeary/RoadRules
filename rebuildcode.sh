#!/bin/bash
rm hwcode.html downloadedhwcode.html
./hwcodedownloader.sh
cat htmlpreamble.html downloadedhwcode.html htmlcoda.html | awk -f duplicateremover.awk  > hwcode.html
