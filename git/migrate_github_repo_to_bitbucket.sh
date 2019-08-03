#!/usr/bin/env bash

GITHUB_USER=user1
GITHUB_REPO_NAME=test1

BITBUCKET_USER=user2
BITBUCKET_REPO_NAME=test2

git clone --mirror git@github.com:${GITHUB_USER}/${GITHUB_REPO_NAME}.git
git remote add bitbucket git@bitbucket.org:${BITBUCKET_USER}/${NEW_REPO_NAME}.git
git push bitbucket --mirror