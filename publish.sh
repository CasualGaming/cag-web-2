#!/usr/bin/env bash

set -e
shopt -s dotglob

TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")

# Prepare master dir
cd public
git fetch
find . -regextype sed -not -regex "^\\.$" -not -regex "^\\./\\.git$" -delete
cd ..

# Build
hugo -v

# Publish to master
read -p "Press enter to publish, or CTRL+C to cancel"
cd master
git add -A
git commit -m "Build $TIMESTAMP"
git push --force
