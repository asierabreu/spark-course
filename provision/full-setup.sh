#!/bin/bash

JAVA_VERSION='openjdk-8-jre-headless'
SPARK_VERSION='spark-2.2.0-bin-hadoop2.7'
CONDA_VERSION='Anaconda3-5.0.1-Linux-x86_64.sh'
ZEPPL_VERSION='zeppelin-0.7.3-bin-all'

CONDA_DIR='/usr/local/conda'
SPARK_DIR='/usr/local/spark'
ZEPEL_DIR='/usr/local/zeppelin'

echo "Provisioning virtual machine..."

# Update variables Configure environment
SHELL=/bin/bash 
NB_USER=spark 
NB_UID=1000 
NB_GID=100 
LC_ALL=en_US.UTF-8 
LANG=en_US.UTF-8 
LANGUAGE=en_US.UTF-8
PATH=$CONDA_DIR/bin:$PATH 

fix-permissions /usr/local/bin/fix-permissions

useradd -m -s /bin/bash -N -u $NB_UID $NB_USER && \
    chown $NB_USER:$NB_GID $CONDA_DIR && \
    fix-permissions $HOME && \
    fix-permissions $CONDA_DIR && \
    fix-permissions $SPARK_DIR && \
    fix-permissions $ZEPEL_DIR

# Java
echo "Installing ${JAVA_VERSION} ..."
apt-get install $JAVA_VERSION -yq --no-install-recommends \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Anaconda (Python with some extra interesting stuff) in silent mode , i.e, no prompts
echo "Installing Anaconda (Python 3.6) ..."
wget https://repo.continuum.io/archive/$CONDA_VERSION
bash $CONDA_VERSION -b -p $CONDA_DIR

# Spark 2.2.0
echo "Installing Spark ${SPARK_VERSION} ..."
mkdir $SPARK_DIR
wget --timeout=1 --tries=5 --retry-connrefused http://apache.uvigo.es/spark/spark-2.2.0/$SPARK_VERSION
mv $SPARK_VERSION $SPARK_DIR
cd $SPARK_DIR
tar zxf $SPARK_VERSION
cd 	

# Zepellin 
echo "Installing Zeppelin ${ZEPEL_VERSION} ..."
mkdir $ZEPEL_DIR
wget --timeout=1 --tries=5 --retry-connrefused http://apache.uvigo.es/zeppelin/zeppelin-0.7.3/$ZEPEL_VERSION
cd $ZEPEL_DIR
tar zxf $ZEPEL_VERSION
cd 	

# update path
PATH=$SPARK_DIR/bin:$SPARK_DIR/sbin:$ZEPEL_DIR/bin:$PATH

# copy executables to bin
cp /scripts/start_notebook.sh /usr/local/bin/
cp /scripts/start_zeppelin.sh /usr/local/bin/

echo "Finished provisioning."
echo "(0) : type 'vagrant ssh' to login to the newly created VM "
echo " --> Once you have logged into the VM : "
echo "(1) : type 'start_notebook.sh' to launch PySpark (using Jupyter Notebook)"
echo "(2) : type 'start_zepellin.sh' to launch Zeppelin server"
