#!/usr/bin/env bash

# https://rtyley.github.io/bfg-repo-cleaner/
# https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository#purging-a-file-from-your-repositorys-history
# Bash script name: purge_env_files_from_repo.sh
cd test-web.git || exit

# Print version on local machine to see if bfg is working with current Java version
java -jar bfg-1.13.0.jar --version

# Delete .env sensitive files
java -jar bfg-1.13.0.jar --delete-files .env.dev test-web.git
java -jar bfg-1.13.0.jar --delete-files .env.develop test-web.git
java -jar bfg-1.13.0.jar --delete-files .env.docker test-web.git
java -jar bfg-1.13.0.jar --delete-files .env.local test-web.git
java -jar bfg-1.13.0.jar --delete-files .env.production test-web.git
java -jar bfg-1.13.0.jar --delete-files .env.stage test-web.git
java -jar bfg-1.13.0.jar --delete-files .env.staging test-web.git
java -jar bfg-1.13.0.jar --delete-files .env.test test-web.git
java -jar bfg-1.13.0.jar --delete-files .env.testing.example test-web.git

exit
