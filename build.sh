#!/bin/bash

set -x

cd nsarka
hugo
cd ..
mv nsarka/public ./public

set +x