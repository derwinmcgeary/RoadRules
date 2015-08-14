#!/bin/bash
wget --wait 3 --random-wait -i urlslist.txt -O - | tr "\n" "|" | grep -o '<\/aside>.*<footer>' | sed 's/\(<\/aside>\|<footer>\)//g' | sed 's/|/\n/g' | xml2asc > downloaded.html
