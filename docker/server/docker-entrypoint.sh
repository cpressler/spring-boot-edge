#!/bin/bash
set -e

echo "Start entrypoint"

ARTIFACT=spring-boot-edge-server

cd /opt/services/${ARTIFACT}/
# this will force it to run forever in background

#java -Dspring.profiles.active=container -jar  spring-react-qatest-boot.jar

java  -jar  ${ARTIFACT}-boot.jar

echo "DONE entrypoint"
