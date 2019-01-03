#!/usr/bin/env bash

# Clone master branch of all
# repos that we want in our monorepo

mkdir clones
cd clones

git clone https://github.com/taskcluster/taskcluster-queue.git --branch fix-history queue
git clone https://github.com/taskcluster/taskcluster-auth.git auth
git clone https://github.com/taskcluster/taskcluster-github.git github
git clone https://github.com/taskcluster/taskcluster-hooks.git hooks
git clone https://github.com/taskcluster/taskcluster-index.git index
git clone https://github.com/taskcluster/taskcluster-login.git login
git clone https://github.com/taskcluster/taskcluster-notify.git notify
git clone https://github.com/taskcluster/taskcluster-purge-cache.git purge-cache
git clone https://github.com/taskcluster/taskcluster-secrets.git secrets
git clone https://github.com/taskcluster/taskcluster-treeherder.git treeherder

git clone https://github.com/taskcluster/eslint-config-taskcluster.git eslint-config
git clone https://github.com/taskcluster/taskcluster-client.git client
git clone https://github.com/taskcluster/taskcluster-lib-api.git api
git clone https://github.com/taskcluster/taskcluster-lib-app.git app
git clone https://github.com/taskcluster/taskcluster-lib-azure.git azure
git clone https://github.com/taskcluster/taskcluster-lib-docs.git docs
git clone https://github.com/taskcluster/taskcluster-lib-iterate.git iterate
git clone https://github.com/taskcluster/taskcluster-lib-loader.git loader
git clone https://github.com/taskcluster/taskcluster-lib-monitor.git monitor
git clone https://github.com/taskcluster/taskcluster-lib-pulse.git pulse
git clone https://github.com/taskcluster/taskcluster-lib-references.git references
git clone https://github.com/taskcluster/taskcluster-lib-scopes.git scopes
git clone https://github.com/taskcluster/taskcluster-lib-testing.git testing
git clone https://github.com/taskcluster/taskcluster-lib-validate.git validate
git clone https://github.com/taskcluster/typed-env-config.git

git clone https://github.com/taskcluster/taskcluster-builder.git builder
git clone https://github.com/taskcluster/taskcluster-terraform.git terraform

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Arbitary steps we need to take to clean up
# histories that are broken enough to make
# lerna fail to import

#cd taskcluster-queue
#git filter-branch -f --index-filter "git rm -rf --cached --ignore-unmatch node_modules" HEAD
#git filter-branch -f --index-filter "git rm -rf --cached --ignore-unmatch taskcluster-queue.conf.json.enc" HEAD
