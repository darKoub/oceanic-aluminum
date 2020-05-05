#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5eb151bf91c5b50019bd41ca/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5eb151bf91c5b50019bd41ca
curl -s -X POST https://api.stackbit.com/project/5eb151bf91c5b50019bd41ca/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5eb151bf91c5b50019bd41ca/webhook/build/publish > /dev/null
