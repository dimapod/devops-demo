#!/usr/bin/env bash

# Prepare Base AMI ID
APPLICATION_IP=$(head -n 1 application-ip-s3/application-ip)
MONITORING_IP=$(head -n 1 monitoring-ip-s3/monitoring-ip)

echo "Application PI: ${APPLICATION_IP}"
echo "Monitoring PI: ${MONITORING_IP}"

ls monitoring-keys

# Prepare hosts
rm devops-infra/infra/monitoring/provision/ansible/hosts
cp monitoring-ip-s3/monitoring-ip devops-infra/infra/monitoring/provision/ansible/hosts

# Provision
cd devops-infra/infra/monitoring/provision/ansible
ansible-playbook site.yml --private-key=../../../../../monitoring-keys/dpo-monitoring
