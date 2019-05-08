#!/bin/bash

# Fixes permissions for cag-web-2.
# Use 0600 (rw) for most files and 0700 (rwx) for most folders.
# Must be called with the project dir as the PWD.

# Base dir
chown root:root .
chmod 0700 .

# Main scripts
chown root:root *.sh
chmod 0700 *.sh

# Public web root, accessable by nginx
mkdir -p web
chown -R cag-web-2:cag-web-2 web
chmod 0755 web

# Logs
mkdir -p log
chown root:root log
chmod 0700 log

# Temporaty web root
rm -rf web.tmp
