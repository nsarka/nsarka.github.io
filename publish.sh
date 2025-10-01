#!/bin/bash

set -x

# Readd CNAME
touch ./to_publish/CNAME
echo "nsarka.com" > ./to_publish/CNAME

# Check out the master branch for pushing the public folder
git checkout master

mv ./to_publish/* ./
rm -rf ./to_publish

set +x
