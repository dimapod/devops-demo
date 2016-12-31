#!/usr/bin/env bash

# Prepare Base AMI ID
APPLICATION_IP=$(head -n 1 application-ip-s3/application-ip)
MONITORING_IP=$(head -n 1 monitoring-ip-s3/monitoring-ip)

# Prepare previous infrastructure description
#cp infra-description-s3/terraform.tfstate devops-infra/infra/infra-as-code/

echo "Application PI: ${APPLICATION_IP}"
echo "Monitoring PI: ${MONITORING_IP}"

ls monitoring-keys

## Prepare AWS Keys
#export TF_VAR_access_key=${AWS_ACCESS_KEY_ID}
#export TF_VAR_secret_key=${AWS_SECRET_ACCESS_KEY}
#
## TODO: Create docker image with ssh
#apk --update add openssh   && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config   && echo "root:root" | chpasswd   && rm -rf /var/cache/apk/*
#
## Plan/Apply terraform
#cd devops-infra/infra/monitoring/provision/terraform
#
## Generate KEY
#ssh-keygen -t rsa -b 4096 -f dpo-monitoring -t rsa -N '' -C "monitoring@example.com"
#
#case "$1" in
#    plan)
#        terraform plan
#    ;;
#    apply)
#        terraform apply
#    ;;
#esac
#
## Create application-ip file with current application IP
#terraform output ip > ../../../../../infra-description/monitoring-ip
#
## Copy current infrastructure description
#cp terraform.tfstate ../../../../../infra-description/terraform-monitoring.tfstate
#
## Copy keys
#cp dpo-monitoring* ../../../../../infra-description
