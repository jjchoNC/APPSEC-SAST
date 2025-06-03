#!/bin/bash

docker run --rm -v ${PWD}/code/DVWA:/usr/src \
  sonarsource/sonar-scanner-cli \
  -Dsonar.projectKey=dvwa \
  -Dsonar.projectName=DVWA \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.token=<TOKEN> \
  -Dsonar.scm.exclusions.disabled=true

curl -u <TOKEN>: "http://localhost:9000/api/issues/search?componentKeys=dvwa" -o reports/sonarqube-dvwa.json

# https://github.com/soprasteria/sonar-report
sonar-report --sonarurl="http://localhost:9000/" --project="DVWA" --sonartoken=<TOKEN> --application="DVWA" --sonarcomponent="dvwa" --sonarusername="admin" --sonarpassword="admin"