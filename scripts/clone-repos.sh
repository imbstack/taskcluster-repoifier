#!/usr/bin/env bash

# Clone master branch of all
# repos that we want in our monorepo

mkdir clones
cd clones

git clone https://github.com/taskcluster/taskcluster-queue.git --branch fix-history
git clone https://github.com/taskcluster/taskcluster-auth.git
git clone https://github.com/taskcluster/taskcluster-events.git
git clone https://github.com/taskcluster/taskcluster-github.git
git clone https://github.com/taskcluster/taskcluster-hooks.git
git clone https://github.com/taskcluster/taskcluster-index.git
git clone https://github.com/taskcluster/taskcluster-login.git
git clone https://github.com/taskcluster/taskcluster-notify.git
git clone https://github.com/taskcluster/taskcluster-purge-cache.git
git clone https://github.com/taskcluster/taskcluster-secrets.git
git clone https://github.com/taskcluster/taskcluster-treeherder.git

git clone https://github.com/taskcluster/eslint-config-taskcluster.git
git clone https://github.com/taskcluster/taskcluster-client.git --branch fix-tests
git clone https://github.com/taskcluster/taskcluster-lib-api.git
git clone https://github.com/taskcluster/taskcluster-lib-app.git
git clone https://github.com/taskcluster/taskcluster-lib-azure.git
git clone https://github.com/taskcluster/taskcluster-lib-docs.git
git clone https://github.com/taskcluster/taskcluster-lib-iterate.git --branch monorepo-prep
git clone https://github.com/taskcluster/taskcluster-lib-loader.git
git clone https://github.com/taskcluster/taskcluster-lib-monitor.git
git clone https://github.com/taskcluster/taskcluster-lib-pulse.git
git clone https://github.com/taskcluster/taskcluster-lib-references.git
git clone https://github.com/taskcluster/taskcluster-lib-scopes.git
git clone https://github.com/taskcluster/taskcluster-lib-testing.git
git clone https://github.com/taskcluster/taskcluster-lib-urls.git
git clone https://github.com/taskcluster/taskcluster-lib-validate.git
git clone https://github.com/taskcluster/typed-env-config.git

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Arbitary steps we need to take to clean up
# histories that are broken enough to make
# lerna fail to import

#cd taskcluster-queue
#git filter-branch -f --index-filter "git rm -rf --cached --ignore-unmatch node_modules" HEAD
#git filter-branch -f --index-filter "git rm -rf --cached --ignore-unmatch taskcluster-queue.conf.json.enc" HEAD
