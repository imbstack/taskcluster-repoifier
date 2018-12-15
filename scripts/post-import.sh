#!/usr/bin/env bash

cd taskcluster

# Get rid of old yarn.locks
find {libraries,services} -name "yarn.lock" -delete

# Get rid of old eslint configs
find {libraries,services} -name ".eslintrc" -delete

for file in $(ls {libraries,services}/*/package.json); do
	jq 'del(.repository,.scripts.pretest)' $file | sponge $file
done

yarn

git add ./yarn.lock
git commit -am "Post import fixes"
