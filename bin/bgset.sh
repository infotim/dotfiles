#!/bin/bash
set -e

CMD="feh --bg-scale"
IMAGE_DIR=~/media/image/yandex

if [ $# -eq 0 ]; then
    if [ -d $IMAGE_DIR ]; then
        $CMD $(find "$IMAGE_DIR" -type f -print | sort -R | head -1)
    fi
else
    $CMD $1
fi
