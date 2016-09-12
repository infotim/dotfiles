# system directories
blacklist /sbin
blacklist /usr/sbin

# system management
blacklist ${PATH}/umount
blacklist ${PATH}/mount
blacklist ${PATH}/fusermount
blacklist ${PATH}/su
blacklist ${PATH}/sudo
blacklist ${PATH}/xinput
blacklist ${PATH}/evtest
blacklist ${PATH}/xev
blacklist ${PATH}/strace

# Prevent manipulation of firejail configuration
blacklist /etc/firejail
blacklist ${HOME}/.config/firejail

whitelist ${HOME}/.config/google-chrome
whitelist ${HOME}/.config/pulse
whitelist ${HOME}/.cache/google-chrome
whitelist ${HOME}/download
