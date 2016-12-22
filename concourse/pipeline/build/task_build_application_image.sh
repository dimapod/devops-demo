#!/usr/bin/env bash

# Prepare Base AMI ID
AMI=$(head -n 1 golden-ami-s3/base-golden-ami.txt)
VERSION=$(head -n 1 golden-ami-s3/version)
echo "Using golden base image: ${AMI}"
export AMI_BASE_IMAGE=${AMI}

# Copy built artifact
mkdir -p resource-app/gs-spring-boot/target
cp my-product-rc/gs-spring-boot-*.jar resource-app/gs-spring-boot/target/

cd resource-app/golden-image/application-image

packer build -only amazon-ebs packer-application-image.json > output.txt

echo "-----------------------"
echo "Built image $(tail -3 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }')"
echo "-----------------------"

tail -2 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }' > ../../../golden-application-image/application-golden-ami.txt

