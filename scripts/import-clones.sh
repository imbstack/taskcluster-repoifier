#!/usr/bin/env bash

mkdir taskcluster
cd taskcluster

git init .
cp ../scripts/eslintrc.yml ./.eslintrc.yml
cp ../scripts/gitignore ./.gitignore
cp ../scripts/eslintignore ./.eslintignore
cp ../scripts/CODE_OF_CONDUCT.md ./CODE_OF_CONDUCT.md
cp ../scripts/CONTRIBUTING.md ./CONTRIBUTING.md
cp ../scripts/README.md ./README.md
cp ../scripts/LICENSE ./LICENSE
cp ../scripts/package.json .
cp ../scripts/lerna.json .

mkdir .github
cp ../scripts/CODEOWNERS ./.github/CODEOWNERS

git add .
git commit -m "Init"

lerna import --flatten -y --dest services ../clones/queue
lerna import --flatten -y --dest services ../clones/auth
lerna import --flatten -y --dest services ../clones/events
lerna import --flatten -y --dest services ../clones/github
lerna import --flatten -y --dest services ../clones/hooks
lerna import --flatten -y --dest services ../clones/index
lerna import --flatten -y --dest services ../clones/login
lerna import --flatten -y --dest services ../clones/notify
lerna import --flatten -y --dest services ../clones/purge-cache
lerna import --flatten -y --dest services ../clones/secrets
lerna import --flatten -y --dest services ../clones/treeherder

lerna import --flatten -y --dest libraries ../clones/eslint-config
lerna import --flatten -y --dest libraries ../clones/client
lerna import --flatten -y --dest libraries ../clones/api
lerna import --flatten -y --dest libraries ../clones/app
lerna import --flatten -y --dest libraries ../clones/azure
lerna import --flatten -y --dest libraries ../clones/docs
lerna import --flatten -y --dest libraries ../clones/iterate
lerna import --flatten -y --dest libraries ../clones/loader
lerna import --flatten -y --dest libraries ../clones/monitor
lerna import --flatten -y --dest libraries ../clones/pulse
lerna import --flatten -y --dest libraries ../clones/references
lerna import --flatten -y --dest libraries ../clones/scopes
lerna import --flatten -y --dest libraries ../clones/testing
lerna import --flatten -y --dest libraries ../clones/validate
lerna import --flatten -y --dest libraries ../clones/typed-env-config
