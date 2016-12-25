#!/usr/bin/env bash

# Prepare Base AMI ID
AMI=$(head -n 1 application-image-s3/application-image-id)
VERSION=$(head -n 1 application-image-s3/version)

# Prepare previous infrastructure description
mv devops-infra/infra-as-code/terraform.tfstate devops-infra/infra-as-code/terraform.tfstate_old
cp infra-description-s3/terraform.tfstate devops-infra/infra-as-code/

# Prepare AWS Keys
echo "Using application image: ${AMI}"
export TF_VAR_access_key=${AWS_ACCESS_KEY_ID}
export TF_VAR_secret_key=${AWS_SECRET_ACCESS_KEY}
export TF_VAR_application_ami=${AMI}

# Plan/Apply terraform
cd devops-infra/infra-as-code

case "$1" in
    plan)
        terraform plan
    ;;
    apply)
        terraform destroy apply
    ;;
esac


# Copy current infrastructure description
cp terraform.tfstate ../../infra-description/
