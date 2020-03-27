#!/usr/bin/env bash

BITBUCKET_USER=user1
REPO_NAME=test1

NEW_BITBUCKET_USER=user2
NEW_REPO_NAME=test2

git clone --mirror git@bitbucket.org:${BITBUCKET_USER}/${REPO_NAME}.git
cd ${REPO_NAME}.git || exit
git remote add bitbucket git@bitbucket.org:${NEW_BITBUCKET_USER}/${NEW_REPO_NAME}.git
git push bitbucket --mirror
