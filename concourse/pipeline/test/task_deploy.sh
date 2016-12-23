#!/usr/bin/env bash

# Prepare Base AMI ID
AMI=$(head -n 1 application-image-s3/application-image-id)
VERSION=$(head -n 1 application-image-s3/version)

echo "Using application image: ${AMI}"
export TF_VAR_access_key=${AWS_ACCESS_KEY_ID}
export TF_VAR_secret_key=${AWS_SECRET_ACCESS_KEY}
export TF_VAR_application_ami=${AMI}

set | grep TF_VAR

cd devops-infra/infra-as-code

terraform -v
terraform plan
terraform apply

cp terraform.tfstate ../../infra-description/
