#!/usr/bin/env bash

set -e

TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")

# Make sure submodules are updated
echo "Updating submodules ..."
./update-submodules.sh

# Empty publish branch dir
echo "Emptying publishing branch directory ..."
cd public
find . -regextype sed -not -regex "^\\.$" -not -regex "^\\./\\.git$" -delete
cd ..

# Build
echo "Building site ..."
hugo -v
echo "Build successful! (But do check for errors above manually.)"

# Publish to master
echo
echo "Do you wish to publish the built site?"
read -p "Press ENTER to continue, or CTRL+C to cancel."
cd public
git add -A
git commit --allow-empty -m "Build $TIMESTAMP"
git push --force
echo "Publish successful!"
