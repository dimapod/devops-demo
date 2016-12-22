#!/usr/bin/env bash

echo "AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}"

cd resource-app/packer

packer build -only amazon-ebs packer-server.json | tee output.txt

echo "Built image $(tail -3 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }')"

tail -3 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }' > ../../output