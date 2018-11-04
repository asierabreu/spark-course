#!/bin/bash

PROVISION_DIR="provision"
if [ ! -d "$PROVISION_DIR" ];then
  echo 'please download first the git repo : git clone https://github.com/asierabreu/spark-course' 
  exit
fi

# specify version to be downloaded
ANACONDA='Anaconda3-latest-Linux-x86_64.sh'
MINICONDA='Miniconda3-latest-Linux-x86_64.sh'
SPARK='spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz'
ZEPPELIN='zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz'
cd $PROVISION_DIR
echo 'Downloading Anaconda ...'
# curl -O -# https://repo.continuum.io/miniconda/$MINICONDA
curl -O -# https://repo.continuum.io/archive/$ANACONDA
echo 'Downloading Apache Spark ...'
curl -O -# http://apache.rediris.es/spark/$SPARK
echo 'Downloading Apache Zeppellin ...'
curl -O -# http://apache.rediris.es/zeppelin/$ZEPPELIN
cd 
