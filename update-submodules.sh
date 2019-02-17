#!/usr/bin/env bash

set -e
set -u

THEME="fifty"

git fetch
git submodule update --init --recursive --force

cd public
git fetch
git checkout --force master
cd ..

cd "themes/$THEME"
git fetch
git checkout --force master
cd ../..
