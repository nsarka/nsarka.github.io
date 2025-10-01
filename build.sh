#!/bin/bash

set -x

cd nsarka
hugo
cd ..
cp -r nsarka/public ./public

set +x