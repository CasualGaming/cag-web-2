#!/bin/bash

# Deployment script for cag-web-2.
# Must be called with the project dir as the PWD.

IMAGE="casualgaming/cag-web-2:latest"
WEB_DIR="web"
WEB_TMP_DIR="web.tmp"
CONTAINER_WEB_DIR="/web"
CONTAINER_WEB_TMP_DIR="/web.tmp"
LOCK_DIR="deploy.lock"

set -eu # Exit on error and error on undefined var

# mkdir uses atomic check-and-create
if ! mkdir $LOCK_DIR 2>/dev/null; then
  echo "Warning: Another app deployment for this instance is already running, returning instead" 1>&2
  exit -1
fi
trap "rm -rf $LOCK_DIR" EXIT

echo "Pulling images ..."
docker pull $IMAGE | cat

echo "Extracting new web root ..."
rm -rf $WEB_TMP_DIR
docker run --rm -v $PWD/$WEB_TMP_DIR:$CONTAINER_WEB_TMP_DIR $IMAGE cp -r $CONTAINER_WEB_DIR/. $CONTAINER_WEB_TMP_DIR

echo "Replacing existing web root ..."
# Replace files without replacing mounted dir
find $WEB_DIR -mindepth 1 -delete
cp -r $WEB_TMP_DIR/. $WEB_DIR
rm -rf $WEB_TMP_DIR

echo "Fixing permissions ..."
./fix-permissions.sh
