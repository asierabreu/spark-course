#!/bin/bash

wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.0.0/ambari.list
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
apt-get update

# Install Ambari
echo 'Installing Apache Ambari server ...' 
apt-get -qq install ambari-server

# Setup. There are several options to configure during setup.
echo 'Setting up Apache Ambari server ...'
ambari-server setup -s
     
# Start Ambari Server
echo 'Starting Apache Ambari server ...'
ambari-server start
