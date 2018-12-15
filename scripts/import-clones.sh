#!/usr/bin/env bash

mkdir taskcluster
cd taskcluster

git init .
cp ../scripts/eslintrc.yml ./.eslintrc.yml
cp ../scripts/gitignore ./.gitignore
cp ../scripts/eslintignore ./.eslintignore
cp ../scripts/package.json .
cp ../scripts/lerna.json .
git add .
git commit -m "Init"

lerna import --flatten -y --dest services ../clones/taskcluster-queue
lerna import --flatten -y --dest services ../clones/taskcluster-auth
lerna import --flatten -y --dest services ../clones/taskcluster-events
lerna import --flatten -y --dest services ../clones/taskcluster-github
lerna import --flatten -y --dest services ../clones/taskcluster-hooks
lerna import --flatten -y --dest services ../clones/taskcluster-index
lerna import --flatten -y --dest services ../clones/taskcluster-login
lerna import --flatten -y --dest services ../clones/taskcluster-notify
lerna import --flatten -y --dest services ../clones/taskcluster-purge-cache
lerna import --flatten -y --dest services ../clones/taskcluster-secrets
lerna import --flatten -y --dest services ../clones/taskcluster-treeherder

lerna import --flatten -y --dest libraries ../clones/eslint-config-taskcluster
lerna import --flatten -y --dest libraries ../clones/taskcluster-client
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-api
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-app
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-azure
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-docs
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-iterate
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-loader
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-monitor
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-pulse
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-references
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-scopes
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-testing
lerna import --flatten -y --dest libraries ../clones/taskcluster-lib-validate
lerna import --flatten -y --dest libraries ../clones/typed-env-config
