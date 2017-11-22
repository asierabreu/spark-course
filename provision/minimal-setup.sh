#!/bin/bash

JAVA_VERSION='openjdk-8-jre-headless'

echo "Provisioning virtual machine..."

# Java
echo "Installing ${JAVA_VERSION} ..."
apt-get install $JAVA_VERSION -qq > /dev/null \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# copy executables to bin
cp /scripts/start_notebook.sh /usr/local/bin/
cp /scripts/start_zeppelin.sh /usr/local/bin/

echo "Finished provisioning."
echo "Type 'vagrant ssh' to login to the newly created VM "
