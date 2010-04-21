We are using English strings for gettext message ids.

Instructions:
1) Run ./manage.py extract in the kitsune directory. This will create kitsune/locale/z-messages.pot
2) merge-po.sh z-messages.pot en_US
3) merge-enus2all.sh

Optional:
4) compile-mo.sh .

New Locales:
msginit --locale=fr -i en_US/LC_MESSAGES/messages.po
