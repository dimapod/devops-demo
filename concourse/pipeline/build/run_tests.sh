#!/bin/sh

echo "Run 'mvn clean install' here ..."

pwd

cd devops-infra/gs-spring-boot/

mvn clean install

mv target ../../gs-bundle