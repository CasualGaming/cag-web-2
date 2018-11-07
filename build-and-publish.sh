#!/usr/bin/env bash

set -e
shopt -s dotglob

TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")

# Clean
find master -regextype sed -not -regex "^master$" -not -regex "^master/.git$" -delete

# Build
hugo -v

# Publish
read -p "Press enter to publish, or CTRL+C to cancel"
cd master
git add -A
git commit -m "Build $TIMESTAMP"
git push
