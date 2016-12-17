#!/bin/bash

#AWS_URL=$(vagrant ssh-config | grep HostName | awk '{print $2}')
SCRIPT_PATH="`dirname \"$0\"`"
AWS_URL=$(head -n 1 ${SCRIPT_PATH}/.aws_host)
echo "http://${AWS_URL}:8080"