#!/usr/bin/env bash

cd devops-infra/infra/golden-image/base-image

packer build -only amazon-ebs packer-base-image.json | tee output.txt

echo "-----------------------"
echo "Built image $(tail -2 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }')"
echo "-----------------------"

tail -2 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }' > ../../../../output/base-image-id