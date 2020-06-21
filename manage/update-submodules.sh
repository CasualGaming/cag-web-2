#!/bin/bash

set -eu

THEME="fifty"

echo "Initializing/updating theme submodule ..."
git fetch
git submodule update --init --recursive --force

echo
echo "Updating submodule to latest version ..."
cd "themes/$THEME"
git fetch
git checkout --force master
git pull
