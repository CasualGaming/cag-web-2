#!/bin/bash

set -eu

IMAGE_NAME="cag-web-2:dev"
ENDPOINT="[::1]:1313"

echo "Running server ..."
docker run --rm -p"$ENDPOINT:80/tcp" "$IMAGE_NAME"
