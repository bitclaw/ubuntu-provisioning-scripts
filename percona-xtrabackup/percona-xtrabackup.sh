#!/usr/bin/env bash

# Install percona xtrabackup
# This script should work for all debian based distributions

wget https://repo.percona.com/apt/percona-release_latest.$(dpkg --status tzdata|grep Provides|cut -f2 -d'-')_all.deb && \
apt-get --fix-broken install && \
dpkg -i percona-release_latest.$(dpkg --status tzdata|grep Provides|cut -f2 -d'-')_all.deb && \
percona-release enable-only tools release && \
apt-get update -y && \
apt-get install percona-xtrabackup-80 -y


