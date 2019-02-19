#!/usr/bin/env bash

set -x

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
TARGETS=$(find ./ -maxdepth 1 -mindepth 1 -type d | awk -F'/' '{print $3}')

for TARGET in $TARGETS
do
  HAS_DIFF=$(git --no-pager diff --name-only HEAD^ HEAD --relative=${TARGET})
  if [ ! -z $HAS_DIFF ]; then
    echo "Build a Dockerfile"
  fi
done