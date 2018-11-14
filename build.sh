#!/usr/bin/env bash

set -e
shopt -s dotglob

# Clean
find public -regextype sed -not -regex "^master$" -not -regex "^master/.git$" -delete

# Build
hugo -v
