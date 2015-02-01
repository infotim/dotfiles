#!/bin/bash
set -e

UUID=${UUID-"43a4b92b-a084-4e38-a525-9bb853fe928e"}

sudo cryptsetup luksOpen UUID=$UUID $UUID
sudo mkdir -m 0775 /mnt/$UUID 2>/dev/null || true
sudo mount /dev/mapper/$UUID /mnt/$UUID
