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

for lang in `find $2 -type f -name "*.po"`; do
    echo "Lang: ${lang}"
    # this line was changed because msgmerge was outputting nothing
    # and this nothingness was being written into en_US/LC_MESSAGES/messages.po
    # I *think* this was written under the assumption that msgmerge
    # actually outputted the results of the merge to stdin, but this is not
    # the case for msgmerge (GNU gettext-tools) 0.17
    # old lines: 
    # msgmerge --update $lang $1 > $TMPFILE
    # cp "$TMPFILE" "$lang"
    msgmerge --update $lang $1
done
rm "$TMPFILE"

