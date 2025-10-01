#!/bin/bash

set -x

cd nsarka
hugo
cd ..
mv nsarka/public ./to_publish
echo ./to_publish folder created, deploy it to master with ./publish.sh

set +x
