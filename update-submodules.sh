#!/usr/bin/env bash

echo "Please update the theme manually instead. The master is updated when publishing."
exit 1

git fetch
git submodule update --init --recursive
