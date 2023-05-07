#!/bin/bash
set -x
set -e
set -o pipefail

URL=$1
BRANCH=$2

TEMP=$(mktemp -d -t mgd-XXX)
trap 'rm -rf ${TEMP}' EXIT
CLONE=${TEMP}/clone
ORIGIN=$(pwd)

echo -e "\nBuilding Middleman site:"
rm -rf build
middleman build

if [ ! -e build ]; then
  echo -e "\nMiddleman didn't generate anything in build!"
  exit -1
fi

echo -e "\nCloning Github repository:"
git clone "${URL}" "${CLONE}"
cd "${CLONE}"

echo -e "\nPreparing ${BRANCH} branch:"
if [ -z "$(git branch -a | grep origin/${BRANCH})" ]; then
  git checkout --orphan "${BRANCH}"
else
  git checkout "${BRANCH}"
fi

echo -e "\nDeploying into ${BRANCH} branch:"
cp -R ${ORIGIN}/build/* .
rm -f README.md
git add .
git commit -am "new version $(date)" --allow-empty
git push origin "${BRANCH}" 2>&1 | sed 's|'$URL'|[skipped]|g'

echo -e "\nCleaning up: ${TEMP}"