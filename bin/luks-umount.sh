#!/bin/bash
set -e

UUID=${UUID-"43a4b92b-a084-4e38-a525-9bb853fe928e"}

sudo umount /mnt/$UUID
sudo cryptsetup luksClose $UUID
sudo rmdir /mnt/$UUID 2>/dev/null || true
