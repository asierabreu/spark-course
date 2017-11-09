#!/bin/bash

echo "--------------------------------"
echo "Provisioning virtual machine ..."
echo "--------------------------------"

SW_DIR=./software
mkdir $SW_DIR

# Java (open-jdk-8) installation (quietly -qq and pip messages from dpkg to dev null)
# quiet option : -qq -o Dpkg::Use-Pty=0
echo "Installing open-jdk-8 ... please wait"
apt-get -qq -o Dpkg::Use-Pty=0 install openjdk-8-jre-headless > /dev/null

# Firefox
echo "Installing Firefox Web Browser ... please wait"
apt-get -qq -o Dpkg::Use-Pty=0 install firefox > /dev/null

# Python 3.6
# echo "Installing Python ... please wait"
# apt-get -qq -o Dpkg::Use-Pty=0 install python3 > /dev/null

# Miniconda Download (with timeout) and (quiet) Installation
# echo "Installing Miniconda (Python 3.6) ... please wait"
# wget --timeout 5 http://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh 
# mv Miniconda3-3.7.0-Linux-x86_64.sh $SW_DIR
# bash $SW_DIR/Miniconda3-3.7.0-Linux-x86_64.s -b -p $SW_DIR/miniconda > /dev/null

# Full Anaconda Download (with timeout) and (quiet) Installation 
echo "Installing Anaconda (Python 3.6) ... please wait"
wget --timeout 5 https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
mv Anaconda3-5.0.1-Linux-x86_64.sh $SW_DIR
bash $SW_DIR/Anaconda3-5.0.1-Linux-x86_64.sh -b -p $SW_DIR/anaconda > /dev/null

# Spark 2.2.0 Download (with timeout) and (quiet) Installation 
echo "Installing Apache-Spark 2.2.0 ... please wait"
wget --timeout 5 http://mirrors.ocf.berkeley.edu/apache/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
mv spark-2.2.0-bin-hadoop2.7.tgz $SW_DIR
tar zxf $SW_DIR/spark-2.2.0-bin-hadoop2.7.tgz -C $SW_DIR/	

# Zepellin Download (with timeout) and (quiet) Installation 
echo "Installing Apache-Zepellin ... please wait"
wget --timeout 5 http://apache.cs.utah.edu/zeppelin/zeppelin-0.7.3/zeppelin-0.7.3-bin-all.tgz
mv zeppelin-0.7.3-bin-all.tgz $SW_DIR
tar zxf $SW_DIR/zeppelin-0.7.3-bin-all.tgz -C $SW_DIR/	

# Add SPARK home and PYTHON home to bashrc
echo "export SPARK_HOME=$SW_DIR/spark-2.2.0-bin-hadoop2.7" >> .bashrc
echo "export PYTHON_HOME=$SW_DIR/anaconda" >> .bashrc 
echo "export ZEPPELIN_HOME=$SW_DIR/zeppelin-0.7.3-bin-all" >> .bashrc
echo "export PATH=$PYTHON_HOME/bin:$PATH" >> .bashrc 

echo "--------------------------------------"
echo "Provisioning virtual machine finished!"
echo "Type : 'vagrant ssh' to connect to your new VM"
echo "--------------------------------------"
