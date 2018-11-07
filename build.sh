#!/usr/bin/env bash

set -e
shopt -s dotglob

# Clean
find master -regextype sed -not -regex "^master$" -not -regex "^master/.git$" -delete

# Build
hugo -v
