#!/bin/bash

JAVA_VERSION='openjdk-8-jre-headless'
SPARK_VERSION='spark-2.2.0-bin-hadoop2.7'
ZEPPELIN_VERSION="zeppelin-0.7.3-bin-all"
CONDA_INST='Anaconda3-5.0.1-Linux-x86_64.sh'
EXTENSION='.tgz'
SPARK_TGZ=$SPARK_VERSION$EXTENSION
ZEPPELIN_TGZ=$ZEPPELIN_VERSION$EXTENSION

SW_DIR="/usr/local/software"

PROVISION_DIR=$1

if [ -z $PROVISION_DIR];then
  echo 'Must provide a path to the downloaded software location! (./provision.sh <software_packages_loaction>)'
  exit 
fi  

if [ -d "$SW_DIR" ];then
  echo 'directory : $SW_DIR already existing continuing' 
else 
  echo "Creating software directory : $SW_DIR"  
  mkdir -p $SW_DIR
fi

SPARK_DIR="$SW_DIR/spark"
ZEPPE_DIR="$SW_DIR/zeppelin"
CONDA_DIR="$SW_DIR/conda"

if [ ! -d "$SW_DIR" ];then
  echo 'could not create directory : $SW_DIR aborting installation' 
  exit
fi

apt-get update

# Network Time Protocol
apt-get -qq install ntp
update-rc.d ntp defaults

# Open JDK
apt-get -qq install $JAVA_VERSION

# Anaconda (Python with some extra interesting stuff) in silent mode , i.e, no prompts

if [ -d "$CONDA_DIR" ];then
  echo 'conda installation already existing , continuing'  
else
  echo "Installing Anaconda (Python 3.6) ..."
  bash $PROVISION_DIR/$CONDA_INST -b -p $CONDA_DIR
fi
  
# Spark 
if [ -d "$SPARK_DIR" ];then
  echo 'spark installation already existing , continuing'  
else
  echo "Installing Apache Spark ${SPARK_VERSION} ..."
  cp $PROVISION_DIR/$SPARK_TGZ $SW_DIR
  cd $SW_DIR
  tar zxf $SPARK_TGZ
  ln -s $SPARK_VERSION spark
  mkdir "spark/logs"
  cd 
fi
# Zeppelin 
if [ -d "$ZEPPE_DIR" ];then
  echo 'zeppelin installation already existing , continuing'  
else
  echo "Installing Apache Zeppelin ${ZEPPELIN_VERSION} ..."
  cp $PROVISION_DIR/$ZEPPELIN_TGZ $SW_DIR
  cd $SW_DIR
  tar zxf $ZEPPELIN_TGZ
  ln -s $ZEPPELIN_VERSION zeppelin
  mkdir "zeppelin/logs"
  cd 
fi

# Update ownership of directories and contents
chown ubuntu:ubuntu -R $SW_DIR

cp spark-course/scripts/* /usr/local/bin/

echo 'Provisioning finished'
