We are using English strings for gettext message ids.

Instructions:
1) Run 
     ./manage.py extract 
   in the kitsune directory. This will create kitsune/locale/z-messages.pot
2) cd kitsune/locale
3) cp z-messages.pot templates/LC_MESSAGES/messages.pot
   Putting the POT file in templates/ will allow Verbatim to merge the PO files with it automatically.
4) ./merge-po.sh templates/LC_MESSAGES/messages.pot .


Optional:
5) compile-mo.sh .

New Locales:
msginit --locale=fr -i templates/LC_MESSAGES/messages.pot
