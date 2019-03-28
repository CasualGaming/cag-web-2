#!/usr/bin/env bash

set -eu
shopt -s dotglob

OUT_DIR="server"

# Remove output folder if it exists
if [ -d "$OUT_DIR" ]; then
  rm -r "$OUT_DIR"
fi

# Run live server
hugo -v -s . -d $OUT_DIR
