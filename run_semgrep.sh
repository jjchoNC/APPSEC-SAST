#!/bin/bash

pip3 install -r requirements.txt
docker exec semgrep semgrep --config=auto /src/DVWA --sarif --output=/reports/semgrep-dvwa.sarif
sarif html reports/semgrep-dvwa.sarif --output reports/semgrep-dvwa.html