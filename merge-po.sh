#!/bin/bash

# syntax:
# merge-po.sh extracted.pot destination-dir/

function usage() {
    echo "syntax:"
    echo "merge-po.sh extracted.pot destination-dir/"
    exit 1
}

tempfoo=`basename $0`
TMPFILE=`mktemp /tmp/${tempfoo}.XXXXXX` || exit 1
echo $TMPFILE

# check if file and dir are there
if [[ ($# -ne 2) || (! -f "$1") || (! -d "$2") ]]; then usage; fi

for lang in `find $2 -type f -name "*.po" | grep -v templates`; do
    echo -n "Lang: ${lang}"
    tiki_lang=`dirname $lang | sed -e 's/\/LC_MESSAGES//'`
    if [ -f tiki/${tiki_lang}.compendium ]; then
        echo -n " (using legacy Tiki translations) "
        msgmerge -C tiki/${tiki_lang}.compendium --update $lang $1
    else
        msgmerge --update $lang $1
    fi
    
done
rm "$TMPFILE"

