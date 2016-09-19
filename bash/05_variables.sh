if [ -x /usr/bin/python3 ]; then
    declare -rx MY_SITE_PACKAGES=$(python3 -m site --user-site)
fi

if [ ! -d ${HOME}/src ]; then
    mkdir ${HOME}/src
fi
declare -rx MY_SRC=${HOME}/src

declare -rx TODOTXT_DEFAULT_ACTION=ls
