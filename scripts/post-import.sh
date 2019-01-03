#!/usr/bin/env bash

cd taskcluster

# Get rid of old yarn.locks
find {libraries,services} -name "yarn.lock" -delete

# Get rid of old eslint configs
find {libraries,services} -name ".eslintrc" -delete

# Get rid of testing stuff
find {libraries,services} -name ".travis.yml" -delete
find {libraries,services} -name ".taskcluster.yml" -delete

# Get rid of old community stuff
find {libraries,services} -name "CODE_OF_CONDUCT.md" -delete
find {libraries,services} -name "CONTRIBUTING.md" -delete
find {libraries,services} -name "LICENSE" -delete

find {libraries,services} -name "package.json" -exec cat {} \; | 
jq -sr 'map(.devDependencies | keys) | flatten | .[]' |
sort |
uniq |
rg -v '(eslint*|taskcluster-lib-*|typed-env-config)' > ../devDependencies

for file in $(ls {libraries,services}/*/package.json); do
       jq 'del(.repository,.scripts.pretest,.devDependencies,.renovate)' $file | sponge $file
done

for file in $(ls {libraries,services}/*/package.json); do
	sed -Ei 's/"(typed-env-config)":[^,]*/"\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"(taskcluster-client)":[^,]*/"\1": "file:..\/..\/libraries\/client"/' $file
	# Can't just do * here because lib-urls and lib-config don't migrate
	sed -Ei 's/"taskcluster-lib-(api)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(app)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(azure)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(docs)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(iterate)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(loader)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(monitor)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(pulse)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(references)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(scopes)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(testing)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file
	sed -Ei 's/"taskcluster-lib-(validate)":[^,]*/"taskcluster-lib-\1": "file:..\/..\/libraries\/\1"/' $file

	# Now need to get lib-urls up to date
	sed -Ei 's/"taskcluster-lib-(urls)":[^,]*/"taskcluster-lib-\1": "^12.0.0"/' $file
done

yarn

yarn add --dev -W $(cat ../devDependencies)
rm ../devDependencies

git add ./yarn.lock

git commit -am "Post import fixes"

yarn lint --fix 

git commit -am "Lint fixes"
