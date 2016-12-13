#!/usr/bin/env bash

SCRIPT_PATH="`dirname \"$0\"`"
SCRIPT_PATH="`( cd \"$SCRIPT_PATH\" && pwd )`"
if [ -z "$SCRIPT_PATH" ] ; then
  exit 1
fi

docker run --rm -i -t -v ${SCRIPT_PATH}/..:/build -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY xebiafrance/packer-ansible:1.9.4 "packer build -only amazon-ebs packer/packer-server.json"

