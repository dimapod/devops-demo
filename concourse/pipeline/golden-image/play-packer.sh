#!/usr/bin/env bash

echo "AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}"

cd golden-image/base-image

packer build -only amazon-ebs packer-base-image.json | tee output.txt

echo "Built image $(tail -3 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }')"

tail -3 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }' > ../../output/base-golden-ami-0.1.0.txt