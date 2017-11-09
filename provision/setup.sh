#!/bin/bash

echo "--------------------------------"
echo "Provisioning virtual machine ..."
echo "--------------------------------"

SW_DIR=./software/
SPARK_PKG=spark-2.2.0-bin-hadoop2.7.tgz
ZEPPL_PKG=zeppelin-0.7.3-bin-all.tgz

mkdir $SW_DIR

# Java (open-jdk-8) installation (quietly -qq and pip messages from dpkg to dev null)
echo "Installing open-jdk-8 ... please wait"
apt-get -qq -o Dpkg::Use-Pty=0 install openjdk-8-jre-headless > /dev/null

# Firefox
echo "Installing Firefox Web Browser ... please wait"
apt-get -qq -o Dpkg::Use-Pty=0 install firefox > /dev/null

# Python 3.6
echo "Installing Python ... please wait"
apt-get -qq -o Dpkg::Use-Pty=0 install python3 > /dev/null

# Uncomment below for installation : Spark 2.2.0 Download (with timeout) and (quiet) Installation if enabled 
# echo "Installing Apache-Spark ... please wait"
# wget --timeout 5 http://mirrors.ocf.berkeley.edu/apache/spark/spark-2.2.0/$SPARK_PKG
# mv $SPARK_PKG $SW_DIR
# tar zxf $SW_DIR/$SPARK_PKG -C $SW_DIR/	

# Uncomment below for installation : Zepellin Download (with timeout) and (quiet) Installation 
# echo "Installing Apache-Zepellin ... please wait"
# wget --timeout 5 http://apache.cs.utah.edu/zeppelin/zeppelin-0.7.3/$ZEPPL_PKG
# mv $ZEPPL_PKG $SW_DIR
# tar zxf $SW_DIR/$ZEPPL_PKG -C $SW_DIR/	
# fi

echo "--------------------------------------"
echo "Provisioning virtual machine finished!"
echo "Type : 'vagrant ssh' to connect to your new VM"
echo "--------------------------------------"
