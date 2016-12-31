#!/usr/bin/env bash

# Prepare Base AMI ID
APPLICATION_IP=$(head -n 1 application-ip-s3/application-ip)

# Prepare previous infrastructure description
#mv devops-infra/infra/monitoring/provision/terraform/terraform.tfstate devops-infra/infra/monitoring/provision/terraform/terraform.tfstate_old

#cp infra-description-s3/terraform.tfstate devops-infra/infra/infra-as-code/

# Prepare AWS Keys
echo "Application PI: ${APPLICATION_IP}"
export TF_VAR_access_key=${AWS_ACCESS_KEY_ID}
export TF_VAR_secret_key=${AWS_SECRET_ACCESS_KEY}

# Plan/Apply terraform
cd devops-infra/infra/monitoring/provision/terraform

case "$1" in
    plan)
        terraform plan
    ;;
    apply)
        terraform apply
    ;;
esac

# Create application-ip file with current application IP
terraform output ip > ../../../../../infra-description/application-ip

# Copy current infrastructure description
cp terraform.tfstate ../../../../../infra-description/terraform-monitoring.tfstate

