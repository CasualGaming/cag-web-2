#!/bin/bash

APP_DIR="/srv/cag-web-2"
LOG_FILE="remote-deploy.log"

set -eu

cd $APP_DIR
./deploy.sh 2>&1 > $LOG_FILE
