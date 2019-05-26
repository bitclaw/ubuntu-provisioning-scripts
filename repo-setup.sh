#!/bin/bash

# Code where I keep all my repos and work related code
mkdir ~/code

mkdir ~/code/github
mkdir ~/code/github/public
mkdir ~/code/github/bitclaw

mkdir ~/code/bitbucket
mkdir ~/code/bitbucket/public
mkdir ~/code/bitbucket/bitclaw

mkdir ~/code/gitlab
mkdir ~/code/gitlab/public
mkdir ~/code/gitlab/bitclaw

# Give SSH keys correct permission to use with git
chmod 600 ~/.ssh/id_rsa;chmod 600 ~/.ssh/id_rsa.pub