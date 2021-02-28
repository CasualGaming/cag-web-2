#!/bin/bash

set -eu

IMAGE_NAME="cag-web-2:dev"
ENDPOINT="127.0.0.1:1313"

echo "Running server on endpoint $ENDPOINT ..."
cmd="docker run --rm -it -p"$ENDPOINT:80/tcp" "$IMAGE_NAME""

# Windows compatibility
if [[ $(uname -s) == "MINGW"* ]]; then
    winpty $cmd
else
    $cmd
fi
