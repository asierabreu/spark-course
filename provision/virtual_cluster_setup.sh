#!/bin/bash

JAVA_VERSION='openjdk-8-jre-headless'
SPARK_VERSION='spark-2.2.0-bin-hadoop2.7'
CONDA_INST='Anaconda3-5.0.1-Linux-x86_64.sh'
EXTENSION='.tgz'
SPARK_TGZ=$SPARK_VERSION$EXTENSION
ZEPPELIN_TGZ=$ZEPPELIN_VERSION$EXTENSION

SW_DIR="/home/ubuntu/software"

echo "Creating software directory : $SW_DIR"  
mkdir -p $SW_DIR

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
echo "Installing Anaconda (Python 3.6) ..."
bash /spark-course/provision/$CONDA_INST -b -p $CONDA_DIR

# Spark 2.2.0
echo "Installing Apache Spark ${SPARK_VERSION} ..."
cp /spark-course/provision/$SPARK_TGZ $SW_DIR
cd $SW_DIR
tar zxf $SPARK_TGZ
ln -s $SPARK_VERSION spark
mkdir -p "spark/logs"
cd 

# Zeppelin 0.7.3
# echo "Installing Apache Zeppelin ${ZEPPELIN_VERSION} ..."
# cp /spark-course/provision/$ZEPPELIN_TGZ $SW_DIR
# cd $SW_DIR
# tar zxf $ZEPPELIN_TGZ
# ln -s $ZEPPELIN_VERSION zeppelin
# mkdir -p "zeppelin/logs"
# cd 

# Update ownership of directories
chown ubuntu:ubuntu $SPARK_DIR -R
chown ubuntu:ubuntu $CONDA_DIR -R

# Setup Network
source /spark-course/scripts/network_setup.sh

# Setup Spark
source /spark-course/scripts/spark_setup.sh

echo 'Provisioning finished'