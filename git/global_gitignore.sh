#!/usr/bin/env bash

# Configure Git to use the exclude file ~/.gitignore_global for all Git repositories.
echo '.idea/' >> ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
