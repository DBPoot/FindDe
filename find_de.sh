#!/bin/bash
#
# Descr: Script that counts all occurences of "de" in wikipage
#
# Usage: ./find_de.sh <URL>

# get URL
URL=$1
if [ -z "$URL" ]
then
    echo "Please add a URL"
    exit
fi

# download webpage to temporary file
FILE=`mktemp`
wget -q "$URL" -O $FILE

# find occurences of "de" or "De", count the amount found
echo `cat $FILE | sed "s/<[^>]*>//g" | grep -iow "de" | wc -l`


