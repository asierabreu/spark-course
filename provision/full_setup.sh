#!/bin/bash

JAVA_VERSION='openjdk-8-jre-headless'
SPARK_VERSION='spark-2.2.0-bin-hadoop2.7'
ZEPPELIN_VERSION='zeppelin-0.7.3-bin-all'
CONDA_VERSION='Anaconda3-5.0.1-Linux-x86_64.sh'
EXTENSION='.tgz'
SPARK_TGZ=$SPARK_VERSION$EXTENSION
ZEPPELIN_TGZ=$ZEPPELIN_VERSION$EXTENSION

APACHE_DIR='/usr/local/software/apache'
CONDA_DIR='/usr/local/software/conda'

echo "Provisioning virtual machine..."

apt-get update

# Create required dirs
mkdir -p $APACHE_DIR

if [ ! -d "$APACHE_DIR" ];then
  echo 'could not create directory : $APACHE_DIR aborting installation' 
  exit
fi

# Java
echo "Installing ${JAVA_VERSION} ..."
apt-get install $JAVA_VERSION -qq && apt-get clean 

# Java
echo "Installing firefox ..."
apt-get install firefox -qq && apt-get clean

# Anaconda (Python with some extra interesting stuff) in silent mode , i.e, no prompts
echo "Installing Anaconda (Python 3.6) ..."
curl -O -# https://repo.continuum.io/archive/$CONDA_VERSION
bash $CONDA_VERSION -b -p $CONDA_DIR
rm $CONDA_VERSION

# Spark 2.2.0
echo "Installing Spark ${SPARK_VERSION} ..."
curl -O -# http://mirror.cogentco.com/pub/apache/spark/spark-2.2.0/$SPARK_TGZ
if [ ! -f $SPARK_TGZ ]; then
     echo "Problems downloading $SPARK_VERSION aborting installation"
     exit
fi
mv $SPARK_TGZ $APACHE_DIR/
cd $APACHE_DIR
tar zxf $SPARK_TGZ
ln -s $SPARK_VERSION spark
cd 	

# Zepellin 
echo "Installing Zeppelin ${ZEPPELIN_VERSION} ..."
curl -O -# http://ftp.cixug.es/apache/zeppelin/zeppelin-0.7.3/$ZEPPELIN_TGZ
if [ ! -f $ZEPPELIN_TGZ ]; then
    echo "Problems downloading $ZEPPELIN_VERSION aborting installation"
    exit
fi
mv $ZEPPELIN_TGZ $APACHE_DIR/
cd $APACHE_DIR
tar zxf $ZEPPELIN_TGZ
ln -s $ZEPPELIN_VERSION zeppelin
cd 	

# update path
# copy executables to bin
cp /spark-course/scripts/start_notebook.sh /usr/local/bin/
cp /spark-course/scripts/start_zeppelin.sh /usr/local/bin/

# copy Notebooks
cp -r /spark-course/Notebooks $HOME

# update local
echo 'LC_ALL="en_US.UTF-8"' >> /etc/environment
echo 'LANGUAGE="en_US.UTF-8"' >> /etc/environment

echo ""
echo "Finished provisioning."
echo "Type 'vagrant ssh' to login to the newly created VM "
echo "Then type 'source /spark-course/scripts/bash_setup.sh'"
echo ""
