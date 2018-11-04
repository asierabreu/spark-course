#!/bin/bash

PROVISION_DIR=$1

if [ -z $PROVISION_DIR ];then
  echo 'Must provide a path to the downloaded software location! (./vm_setup.sh <software_packages_loaction>)'
  exit 
fi  

# Get the downloaded versions 
JAVA_VERSION='openjdk-8-jre-headless' # fixed

SPARK_TGZ=$(basename $(ls -1 $PROVISION_DIR/spark-*))
ZEPPE_TGZ=$(basename $(ls -1 $PROVISION_DIR/zeppelin-*))
CONDA_TSH=$(basename $(ls -1 $PROVISION_DIR/*conda*))

SPARK_VERSION="${SPARK_TGZ%.*}"
ZEPPE_VERSION="${ZEPPE_TGZ%.*}"
CONDA_VERSION="${CONDA_TSH%.*}"
echo '-----------------------------------'
echo ' '
echo ' '
echo 'Spark Version    : ' $SPARK_VERSION
echo 'Zeppelin Version : ' $ZEPPE_VERSION
echo 'Conda Version    : ' $CONDA_VERSION
echo ' '
echo ' '
echo '-----------------------------------'

SW_DIR="/usr/local/software/"

if [ -d "$SW_DIR" ];then
  echo 'directory : $SW_DIR already existing continuing' 
else 
  echo "Creating software directory : $SW_DIR"  
  mkdir -p $SW_DIR
fi

SPARK_DIR="$SW_DIR/spark"
ZEPPE_DIR="$SW_DIR/zeppelin"
CONDA_DIR="$SW_DIR/miniconda"

if [ ! -d "$SW_DIR" ];then
  echo 'could not create directory : $SW_DIR aborting installation' 
  exit
fi

apt-get update

# Network Time Protocol
apt-get -qq install ntp
update-rc.d ntp defaults

# Open JDK
echo "Installing Java ..."
apt-get -qq install $JAVA_VERSION
 
# Spark 
if [ -d "$SPARK_DIR" ];then
  echo 'spark installation already existing , continuing'  
else
  echo "Installing Apache Spark ..."
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
  echo "Installing Apache Zeppelin ..."
  cp $PROVISION_DIR/$ZEPPE_TGZ $SW_DIR
  cd $SW_DIR
  tar zxf $ZEPPE_TGZ
  ln -s $ZEPPELIN_VERSION zeppelin
  mkdir "zeppelin/logs"
  cd 
fi

# Anaconda (Python with some extra interesting stuff) in silent mode , i.e, no prompts
if [ -d "$CONDA_DIR" ];then
  echo 'conda installation already existing , continuing'  
else
  echo "Installing Anaconda ..."
  bash $PROVISION_DIR/$CONDA_TSH -b -p $CONDA_DIR
fi

# Update ownership of directories and contents
chown ubuntu:ubuntu -R $SW_DIR

cp spark-course/scripts/* /usr/local/bin/

echo 'Provisioning finished'
