#!/bin/bash

set -eu

OUT_DIR="build"
HOST="127.0.0.1"
BASE_URL="http://localhost"

# Remove output folder if it exists
if [ -d "$OUT_DIR" ]; then
  rm -r "$OUT_DIR"
fi

# Run live server
hugo server -wv -s . -d $OUT_DIR --bind=$HOST --baseURL=$BASE_URL
