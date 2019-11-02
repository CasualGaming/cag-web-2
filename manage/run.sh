#!/bin/bash

set -eu

OUT_DIR="build"

# Remove output folder if it exists
if [ -d "$OUT_DIR" ]; then
  rm -r "$OUT_DIR"
fi

# Run live server
hugo server -wv -s . -d $OUT_DIR
