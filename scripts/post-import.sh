#!/usr/bin/env bash

cd taskcluster

# Get rid of old yarn.locks
find packages -name "yarn.lock" -delete

# Get rid of old eslint configs
find packages -name ".eslintrc" -delete

# Get rid of old mocha configs
find packages -name "mocha.opts" -delete

for file in $(ls packages/*/package.json); do
	jq '{name, version, private, dependencies, devDependencies} | del(.devDependencies.mocha)' $file | sponge $file
done

yarn
yarn workspace taskcluster-auth add --dev debug
