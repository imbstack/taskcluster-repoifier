#!/usr/bin/env bash

mkdir taskcluster
cd taskcluster

git init .
cp ../scripts/eslintrc.yml ./.eslintrc.yml
cp ../scripts/gitignore ./.gitignore
cp ../scripts/eslintignore ./.eslintignore
cp ../scripts/mocha.opts ./.mocha.opts
cp ../scripts/package.json .
cp ../scripts/lerna.json .
git add .
git commit -m "Init"

lerna import --flatten -y ../clones/taskcluster-queue
lerna import --flatten -y ../clones/taskcluster-auth
#lerna import --flatten -y ../clones/taskcluster-events
#lerna import --flatten -y ../clones/taskcluster-github
#lerna import --flatten -y ../clones/taskcluster-hooks
#lerna import --flatten -y ../clones/taskcluster-index
#lerna import --flatten -y ../clones/taskcluster-login
#lerna import --flatten -y ../clones/taskcluster-notify
#lerna import --flatten -y ../clones/taskcluster-purge-cache
#lerna import --flatten -y ../clones/taskcluster-secrets
#lerna import --flatten -y ../clones/taskcluster-treeherder

lerna import --flatten -y ../clones/eslint-config-taskcluster
#lerna import --flatten -y ../clones/taskcluster-client
#lerna import --flatten -y ../clones/taskcluster-lib-api
#lerna import --flatten -y ../clones/taskcluster-lib-app
#lerna import --flatten -y ../clones/taskcluster-lib-azure
#lerna import --flatten -y ../clones/taskcluster-lib-docs
#lerna import --flatten -y ../clones/taskcluster-lib-iterate
#lerna import --flatten -y ../clones/taskcluster-lib-loader
#lerna import --flatten -y ../clones/taskcluster-lib-monitor
#lerna import --flatten -y ../clones/taskcluster-lib-pulse
#lerna import --flatten -y ../clones/taskcluster-lib-references
#lerna import --flatten -y ../clones/taskcluster-lib-scopes
#lerna import --flatten -y ../clones/taskcluster-lib-testing
#lerna import --flatten -y ../clones/taskcluster-lib-urls
#lerna import --flatten -y ../clones/taskcluster-lib-validate
#lerna import --flatten -y ../clones/typed-env-config
