#!/bin/bash

# Deployment script for CaG Web II for CI.
# PWD does not need to be the app dir when calling this script.
#
# To call it from a deployment user, add a line like this to the sudoers file:
# deploy ALL=(root) NOPASSWD: /srv/cag-web-2/remote-deploy.sh

APP_DIR="/srv/cag-web-2"
LOG_FILE="remote-deploy.log"

set -eu

cd $APP_DIR
./deploy.sh 2>&1 > $LOG_FILE
