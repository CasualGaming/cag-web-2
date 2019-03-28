#!/usr/bin/env bash

set -eu

THEME="fifty"

# Update repo with submodules
git fetch
git submodule update --init --recursive --force

# Update theme to latest version
cd "themes/$THEME"
git fetch
git checkout --force master
cd ../..
