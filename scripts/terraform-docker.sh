#!/usr/bin/env bash

SCRIPT_PATH="`dirname \"$0\"`"
SCRIPT_PATH="`( cd \"$SCRIPT_PATH\" && pwd )`"
if [ -z "$SCRIPT_PATH" ] ; then
  exit 1
fi

docker run --rm -e TF_VAR_access_key -e TF_VAR_secret_key -v ${SCRIPT_PATH}/../terraform:/data uzyexe/terraform $1