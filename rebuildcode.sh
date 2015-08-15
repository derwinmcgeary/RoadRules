#!/bin/bash
rm hwcode.html downloadedhwcode.html
./hwcodedownloader.sh
cat htmlpreamble.html downloadedhwcode.html htmlcoda.html > hwcode.html
