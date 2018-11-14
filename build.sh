#!/usr/bin/env bash

set -e
shopt -s dotglob

# Clean
find public -regextype sed -not -regex "^public$" -not -regex "^public/\\.git$" -delete

# Build
hugo -v
