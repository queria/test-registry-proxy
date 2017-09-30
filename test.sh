#!/bin/bash

set -x

IMG="${IMG:-fluent/fluentd}"
IMG="${IMG:-library/centos}"

REG="${REG:-https://index.docker.io}"
REG="http://localhost:5000"

TOKEN=$(curl -s "https://auth.docker.io/token?service=registry.docker.io&scope=repository:${IMG}:pull" | jq -r .token)

curl -s -D - -H "Authorization: Bearer $TOKEN" -H "Accept: application/vnd.docker.distribution.manifest.v2+json" ${REG}/v2/${IMG}/manifests/latest

