#!/bin/bash

set -x

cd nsarka
hugo
cd ..
mv nsarka/public /tmp/to_publish
echo /tmp/to_publish folder created, deploy it to master with ./publish.sh

set +x
