#!/bin/bash

set -e

rev=$(git rev-parse --short HEAD)

git config --global user.email "me@davy.tw"
git config --global user.name "Travis on behalf David Kuo"

wget -O index.md https://hackmd.io/BJ5BvWSOf/download

git submodule init
git submodule add -b gh-pages -f --name build "https://$GH_TOKEN@github.com/david50407/symmetrical-octo-happiness.git" build

mv index.md build/index.md
echo "$(date -u -Iseconds) via $(git rev-parse HEAD)" > build/.rev

cd build; git add -fA .; git commit -m "Backup at $(date -uI) [ci skip]"; git push -q || true
