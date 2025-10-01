#!/bin/bash

set -x

cd nsarka
hugo
cd ..
mv nsarka/public ./public
echo Public folder created, deploy it to master with ./publish.sh

set +x
