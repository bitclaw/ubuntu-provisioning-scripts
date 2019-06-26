#!/usr/bin/env bash

# https://danielkummer.github.io/git-flow-cheatsheet/

# Install git flow
sudo apt install git-flow
# cd ~/code/myrepo
git flow init

# This action creates a new feature branch based on 'develop' and switches to it
# i.e: git flow feature start feature/WEB-XXX
git flow feature start MYFEATURE

# Finish the development of a feature. This action performs the
# following:
# Merges MYFEATURE into 'develop'
# Removes the feature branch
# Switches back to 'develop' branch

git flow feature finish MYFEATURE

# Publish a feature to the remote server so it can be used by other
# users.

git flow feature publish MYFEATURE

# Get a feature published by another user.
git flow feature pull origin MYFEATURE

# You can track a feature on origin by using
git flow feature track MYFEATURE

# To start a release, use the git flow release command. It creates a
# release branch created from the 'develop' branch.
# You can optionally supply a [BASE] commit sha-1 hash to start the
# release from. The commit must be on the 'develop' branch.
git flow release start RELEASE [BASE]

# It's wise to publish the release branch after creating it to allow
# release commits by other developers. Do it similar to feature
# publishing with the command:
git flow release publish RELEASE

# You can track a remote release with the
git flow release track RELEASE

# Finishing a release is one of the big steps in git branching. It
# performs several actions:

# Merges the release branch back into 'master'
# Tags the release with its name
# Back-merges the release into 'develop'
# Removes the release branch
# i.e:  git flow release finish 1.14.0
git flow release finish RELEASE
git push origin --tags

# Hotfixes arise from the necessity to act immediately upon an
# undesired state of a live production version May be branched off from
# the corresponding tag on the master branch that marks the production
# version.
# The version argument hereby marks the new hotfix release name.
# Optionally you can specify a basename to start from.
# i.e: git flow hotfix start 1.14.1 [commit] . Commit is optional
git flow hotfix start VERSION [BASENAME]

# By finishing a hotfix it gets merged back into develop and master.
# Additionally the master merge is tagged with the hotfix version.
# git flow hotfix finish 1.14.1

git flow hotfix finish VERSION
