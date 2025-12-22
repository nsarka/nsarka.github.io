#!/bin/bash

set -x

# Readd CNAME
touch /tmp/to_publish/CNAME
echo "nsarka.com" > /tmp/to_publish/CNAME

# Check out the master branch for pushing the public folder
git checkout master

# Remove everything
rm -rf .

# Move in the new files to publish
mv /tmp/to_publish/* ./

set +x
