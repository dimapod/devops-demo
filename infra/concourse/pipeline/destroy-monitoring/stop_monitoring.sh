#!/usr/bin/env bash

# Prepare previous infrastructure description
cp infra-state-monitoring-s3/terraform-monitoring.tfstate devops-infra/infra/monitoring/provision/terraform/terraform.tfstate

# Prepare AWS Keys
export TF_VAR_access_key=${AWS_ACCESS_KEY_ID}
export TF_VAR_secret_key=${AWS_SECRET_ACCESS_KEY}

# Destroy infra
cd devops-infra/infra/monitoring/provision/terraform

case "$1" in
    plan)
        terraform plan --destroy
    ;;
    destroy)
        terraform destroy -force
    ;;
esac

# Copy current infrastructure description
cp terraform.tfstate ../../../../../infra-description/terraform-monitoring.tfstate
