#!/bin/sh

# Topology:

# 192.168.1.1 -- Router
# 192.168.1.0-192.168.1.140 -- local network reserved range
# 192.168.1.144/28 -- docker reserved macvlan range
# 10.8.0.0/24 -- OpenVPN server subnet
# Command used to create docker network

# docker network create -d macvlan --subnet=192.168.1.0/24 --gateway=192.168.1.1 --ip-range=192.168.1.144/28 -o parent=eth0 stack

# Note: In Macvlan you are not able to ping or communicate with the default namespace IP address. For example, if you
# create a container and try to ping the Docker host’s eth0 it will not work. That traffic is explicitly filtered by
# the kernel modules themselves to offer additional provider isolation and security.
# See https://docs.docker.com/v17.06/engine/userguide/networking/get-started-macvlan/#macvlan-bridge-mode-example-usage

# Though, there is a workaround: add a bridged interface and use it as the parent. It was discussed in the old forum.
# Hint: the bridged interface is not permanent, so you will need a startscript to add it on each start of your NAS,
# which MUST be execute before the docker package starts.

# Run it every system bootup
#Set timeout to wait host network is up and running
sleep 60

#Host macvlan bridge recreate

ip link add macvlan-br0 link eth0 type macvlan mode bridge
ip addr add 192.168.1.150/32 dev macvlan-br0
ip link set macvlan-br0 up
ip route add 192.168.1.144/28 dev macvlan-br0