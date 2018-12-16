#!/usr/bin/env bash

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
