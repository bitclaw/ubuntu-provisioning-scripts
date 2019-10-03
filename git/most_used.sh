#!/usr/bin/env bash

git update-index --assume-unchanged src/main/resources/application.yml
git update-index --assume-unchanged src/assets/config.json

# Check all the commit hashes between two dates
git log --after="2018-05-01" --before="2018-05-30" --oneline