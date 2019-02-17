#!/usr/bin/env bash

set -e
set -u

timestamp="$(date +"%Y-%m-%dT%H:%M:%S")"
src_branch="$(git branch | cut -d ' ' -f2)"

echo "Warning: All submodules will be updated, any local changes may be overwritten!"
read -p "Press ENTER to continue, or CTRL+C to cancel"

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
echo "Build successful! (But do check for errors above manually)"

# Publish to master
echo
echo "Do you wish to publish the built site?"
read -p "Press ENTER to continue, or CTRL+C to cancel"

cd public
publish_branch="$(git branch | cut -d ' ' -f2)"
if [[ $src_branch == $publish_branch ]]; then
    echo "Error: Source and publish use the same branch" 1>&2
    exit -1
fi
git add -A
git commit --allow-empty -m "Build $timestamp"
git push --force
echo "Publish successful!"
