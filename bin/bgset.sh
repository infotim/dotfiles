#!/bin/bash
set -e

CMD="feh --bg-scale"
IMAGE_DIR=~/media/image/yandex

if [ $# -eq 0 ]; then
    if [ ! -d $IMAGE_DIR ]; then
        exit 0
    fi
    $CMD $(find "$IMAGE_DIR" -type f -print | sort -R | head -1)
else
    $CMD $1
fi
