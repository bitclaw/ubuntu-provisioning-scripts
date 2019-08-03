#!/usr/bin/env bash

git clone --mirror git@github.com:user/name-of-repo.git
git remote add bitbucket git@bitbucket.org:name-of-repo/name-of-repo.git
git push bitbucket --mirror