# vim: set ft=sh:

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.config/bash/bashrc" ]; then
	. "$HOME/.config/bash/bashrc"
    fi
fi
