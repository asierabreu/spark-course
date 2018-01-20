#!/bin/bash

wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.0.0/ambari.list
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
apt-get update

# Install Ambari
echo 'Installing Apache Ambari server ...' 
apt-get -qq install ambari-server

cho 'Setting up Apache Ambari server ...'
ambari-server setup -s

echo 'Installing Apache Ambari agent ...' 
apt-get -qq install ambari-agent

echo 'Setting up Apache Ambari agent ...'
machine_ip=$(cat /etc/hostname)
tee "/etc/ambari-agent/conf/ambari-agent.ini" > "/dev/null"<<EOF
[server]
hostname=$(cat /etc/hostname)
url_port=8440
secured_url_port=8441
piddir=/var/run/ambari-agent/
logdir=/var/log/ambari-agent/
keysdir=/root/.ssh/
EOF
echo 'Done.'
