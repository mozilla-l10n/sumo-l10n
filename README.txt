(all commands assume you're in Kitsune's root directory)

Updating strings and translations
=================================

Instructions:
1) ./manage.py extract 
   This extracts the localizable English strings into POT files.
2) ./manage.py verbatimize --rename
   This will copy the POT files created in step 1 to locale/templates/LC_MESSAGES
3) ./manage.py merge
   This will update the existing PO files (and create the missing ones) with changes to strings extracted in step 1.

Optional:
4) locale/compile-mo.sh locale
   This will compile the PO files into MO files, which are what the server uses to serve translations.


Adding new locales
==================

Assuming you want to add 'fr':
1) mkdir -p locale/fr/LC_MESSAGES
2) ./manage.py merge

or
1) msginit --no-translator -l fr -i locale/templates/LC_MESSAGES/messages.pot -o locale/fr/LC_MESSAGES/messages.po
2) repeat for other POT files
