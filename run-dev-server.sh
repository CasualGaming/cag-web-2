#!/usr/bin/env bash

set -e
shopt -s dotglob

SERVER_DIR="server"

# Remove output folder if it exists
if [ -d "$SERVER_DIR" ]; then
  rm -r "$SERVER_DIR"
fi

# Run live server
hugo server -wDv -s . -d $SERVER_DIR

# Note: Cancelling the server exits the script as well
