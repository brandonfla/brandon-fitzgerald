#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5f32d18f134070001eae7b6d/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5f32d18f134070001eae7b6d
curl -s -X POST https://api.stackbit.com/project/5f32d18f134070001eae7b6d/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5f32d18f134070001eae7b6d/webhook/build/publish > /dev/null
