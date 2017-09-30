#!/bin/bash
set -x
sg docker "docker run --rm -p 5000:5000 --name v2-mirror -v $(readlink -f "$(dirname "$0")"):/var/lib/registry registry:2 /var/lib/registry/config.yml"
