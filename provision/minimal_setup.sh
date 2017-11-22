#!/bin/bash

JAVA_VERSION='openjdk-8-jre-headless'

echo "Provisioning virtual machine..."

# Java
echo "Installing ${JAVA_VERSION} ..."
apt-get update && apt-get install $JAVA_VERSION -qq > /dev/null && apt-get clean 

# copy executables to bin
cp /spark-course/scripts/start_notebook.sh /usr/local/bin/
cp /spark-course/scripts/start_zeppelin.sh /usr/local/bin/

# update bashrc to include JAVA_HOME
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/' >> .bashrc

echo "Finished provisioning."
echo "Type 'vagrant ssh' to login to the newly created VM "
