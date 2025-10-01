#!/bin/bash

set -x

# Readd CNAME
touch ./public/CNAME
echo "nsarka.com" > ./public/CNAME

# Check out the master branch for pushing the public folder
git checkout master

cp -r ./public/* ./
rm -rf ./public

set +x
