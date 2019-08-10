#!/usr/bin/env bash

GITHUB_USER=bitclaw
GITHUB_REPO_NAME=mongodb-docker

BITBUCKET_USER=bitclaw
BITBUCKET_REPO_NAME=mongodb-docker

git clone --mirror git@github.com:${GITHUB_USER}/${GITHUB_REPO_NAME}.git
cd ${GITHUB_REPO_NAME}.git || exit
#git remote -v
#git remote rm origin
git remote add bitbucket git@bitbucket.org:${BITBUCKET_USER}/${BITBUCKET_REPO_NAME}.git
git push bitbucket --mirror
rm -rf ${GITHUB_REPO_NAME}.git
