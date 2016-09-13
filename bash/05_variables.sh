if [ -x /usr/bin/python3 ]; then
    declare -rx MY_SITE_PACKAGES=$(python3 -m site --user-site)
fi
