#!/usr/bin/env bash

set -e
shopt -s dotglob

TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")

# Make sure submodules are updated
./update-submodules.sh

# Prepare master dir
cd public
git fetch
git checkout --force master
find . -regextype sed -not -regex "^\\.$" -not -regex "^\\./\\.git$" -delete
cd ..

# Build
hugo -v

# Publish to master
read -p "Press ENTER to publish, or CTRL+C to cancel"
cd public
git add -A
git commit --allow-empty -m "Build $TIMESTAMP"
git push --force
