#!/bin/bash
JAVA_VERSION='openjdk-8-jre-headless'
SPARK_VERSION='spark-2.2.0-bin-hadoop2.7'
ZEPPELIN_VERSION='zeppelin-0.7.3-bin-all'
CONDA_INST='Anaconda3-5.0.1-Linux-x86_64.sh'
EXTENSION='.tgz'
SPARK_TGZ=$SPARK_VERSION$EXTENSION
ZEPPELIN_TGZ=$ZEPPELIN_VERSION$EXTENSION

PROVISION_DIR="spark-course/provision"
if [ ! -d "$PROVISION_DIR" ];then
  echo 'please download first the git repo : git clone https://github.com/asierabreu/spark-course' 
  exit
fi
cd $PROVISION_DIR
echo 'Downloading Python Anaconda3-5 ...'
curl -O -# https://repo.continuum.io/archive/$CONDA_INST
echo 'Downloading Apache Spark 2.2.0 ...'
curl -O -# http://mirror.cogentco.com/pub/apache/spark/spark-2.2.0/$SPARK_TGZ
echo 'Downloading Apache Zeppellin 0.7.3 ...'
curl -O -# http://apache.uvigo.es/zeppelin/zeppelin-0.7.3/$ZEPPELIN_TGZ
cd 
