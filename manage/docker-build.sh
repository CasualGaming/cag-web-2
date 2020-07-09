#!/bin/bash

set -eu

IMAGE_NAME="cag-web-2:dev"

docker build -t "$IMAGE_NAME" .
