#!/bin/bash
#
# Descr: Script that counts all occurences of "de" in wikipage from URL
#
# Usage: ./find_de.sh <URL>

# get URL from cmdline
URL=$1
if [ -z "$URL" ]
then
    echo "Please add a URL"
    exit
fi

# download webpage to temporary file
FILE=`mktemp`
wget -q "$URL" -O $FILE

# remove HTML tags, find occurences of "de" or "De", count the amount found
echo `cat $FILE | sed "s/<[^>]*>//g" | grep -iow "de" | wc -l`


