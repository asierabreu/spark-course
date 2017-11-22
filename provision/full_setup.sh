#!/bin/bash

JAVA_VERSION='openjdk-8-jre-headless'
SPARK_VERSION='spark-2.2.0-bin-hadoop2.7'
CONDA_VERSION='Anaconda3-5.0.1-Linux-x86_64.sh'
ZEPEL_VERSION='zeppelin-0.7.3-bin-all'

APACHE_DIR='/usr/local/software/apache'
mkdir $APACHE_DIR
CONDA_DIR='/usr/local/software/conda'

echo "Provisioning virtual machine..."

apt-get update

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
curl -O -# http://mirror.cogentco.com/pub/apache/spark/spark-2.2.0/$SPARK_VERSION'.tgz'
mv $SPARK_VERSION $APACHE_DIR
cd $APACHE_DIR
tar zxf $SPARK_VERSION
ln -s $SPARK_VERSION spark
rm $SPARK_VERSION'.tgz'
cd 	

# Zepellin 
echo "Installing Zeppelin ${ZEPEL_VERSION} ..."
curl -O -# http://mirrors.advancedhosters.com/apache/zeppelin/zeppelin-0.7.3/$ZEPEL_VERSION'.tgz'
mv $ZEPEL_VERSION $APACHE_DIR
cd $APACHE_DIR
tar zxf $ZEPEL_VERSION
ln -s $ZEPEL_VERSION zeppelin
rm $ZEPEL_VERSION'.tgz'
cd 	

# update path
# copy executables to bin
cp /spark-course/scripts/start_notebook.sh /usr/local/bin/
cp /spark-course/scripts/start_zeppelin.sh /usr/local/bin/

# update bashrc to include JAVA_HOME
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre/' >> .bashrc
echo 'export SW_HOME=/usr/local/software'
echo 'export SPARK_HOME=$SW_HOME/apache/spark'
echo 'export ZEPPELIN_HOME=$SW_HOME/apache/zeppelin'
echo 'export CONDA_HOME=$SW_HOME/conda'
echo 'export PATH=$CONDA_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$ZEPPELIN_HOME/bin:$PATH' >> .bashrc

echo "Finished provisioning."
echo "(0) : type 'vagrant ssh' to login to the newly created VM "
echo " --> Once you have logged into the VM : "
echo "(1) : type 'start_notebook.sh' to launch PySpark (using Jupyter Notebook)"
echo "(2) : type 'start_zepellin.sh' to launch Zeppelin server"
