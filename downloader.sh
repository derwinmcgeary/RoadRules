FILENAME = `echo "$1" | sed 's/....$//' | sed 's/^*\///g'`
echo $FILENAME
wget $1 | tr "\n" "|" | grep -o '<\/aside>.*<footer>' | sed 's/\(<\/aside>\|<footer>\)//g' | sed 's/|/\n/g' | xml2asc > $FILENAME
