#!/usr/bin/env bash

# Prepare Base AMI ID
AMI=$(head -n 1 base-image-s3/base-image-id)
VERSION=$(head -n 1 base-image-s3/version)
echo "Using golden base image: ${AMI}"
export AMI_BASE_IMAGE=${AMI}

# Copy built artifact
mkdir -p devops-infra/gs-spring-boot/target
cp application-rc/gs-spring-boot-*.jar devops-infra/gs-spring-boot/target/

cd devops-infra/infra/golden-image/application-image

packer build -only amazon-ebs packer-application-image.json | tee output.txt

echo "-----------------------"
echo "Built image $(tail -2 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }')"
echo "-----------------------"

tail -2 output.txt | head -1 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }' > ../../../../golden-application-image/application-image-id

