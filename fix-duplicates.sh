#!/bin/bash

# syntax:
# fix-duplicates.sh loc1 loc2 ...

function usage() {
    echo "syntax:"
    echo "  fix-duplicates.sh loc1 loc2 ..."
    echo "Must be run from within the 'locale' directory."
    exit 1
}

# check if file and dir are there
if [ $# -ne 1 ]; then usage; fi

CURRENT=`pwd`
for locale in $@; do
    cd ${locale}/LC_MESSAGES/
    for f in `ls -1 *.po`; do
        echo "${locale}: fixing $f"
        msguniq -o $f $f
    done
    cd $CURRENT
done
