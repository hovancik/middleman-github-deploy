#!/bin/bash
set -e
set -x

TMP=$(mktemp -d -t mgd-XXXX)
no | middleman new mgd-XXXX
mv mgd-XXXX/* "${TMP}"

CWD=$(pwd)
git init "${TMP}"
cd "${TMP}"
touch "source/test.html"
echo "hello" > "source/test.html"
git add .
git config user.email "test@example.com"
git config user.name "Test"
git commit -am 'initial commit'
cd "${CWD}"

gem build mgd.gemspec
gem install ./mgd-0.2.0.gem

cd "${TMP}"
mgd --url "${TMP}" --branch gh-pages

cd "${TMP}"
git checkout gh-pages
ls -al
cat test.html | grep "hello"
cd "${CWD}"
rm -rf "${TMP}"
rm -rf "mgd-XXXX/"

echo "success"
