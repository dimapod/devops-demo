#!/usr/bin/env bash

cd golden-ami-s3/

ls -l
cat *

AMI=$(head -n 1 base-golden-ami.txt)
VERSION=$(head -n 1 version)

echo "Using golden base image: ${AMI} version ${VERSION}"

export AMI_BASE_IMAGE=${AMI}

echo "exported : ${AMI_BASE_IMAGE}"


