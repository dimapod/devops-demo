#!/usr/bin/env bash

echo "AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}"

cd resource-app/packer

packer build -only amazon-ebs packer/packer-server.json