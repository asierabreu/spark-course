#!/bin/bash

JAVA_VERSION='openjdk-8-jre-headless'
SPARK_VERSION='spark-2.2.0-bin-hadoop2.7'
CONDA_VERSION='Anaconda3-5.0.1-Linux-x86_64.sh'
ZEPPL_VERSION='zeppelin-0.7.3-bin-all'

CONDA_DIR='/usr/local/conda'
SPARK_DIR='/usr/local/spark'
ZEPEL_DIR='/usr/local/zeppelin'

echo "Provisioning virtual machine..."

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
apt-get install -yq --no-install-recommends \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Update LOCALE (required for proper functioning of some packages) 
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
locale-gen

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
    mkdir -p $CONDA_DIR && \
    mkdir -p $SPARK_DIR && \
    mkdir -p $ZEPEL_DIR && \
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
bash Anaconda3-5.0.1-Linux-x86_64.sh -b -p $CONDA_DIR

# Spark 2.2.0
echo "Installing Spark ${SPARK_VERSION} ..."
wget http://ftp.cixug.es/apache/spark/spark-2.2.0/$SPARK_VERSION
tar zxf $SPARK_VERSION –C $SPARK_DIR	

# Zepellin 
echo "Installing Zeppelin ${ZEPEL_VERSION} ..."
wget http://ftp.cixug.es/apache/zeppelin/zeppelin-0.7.3/$ZEPEL_VERSION
tar zxf $ZEPEL_VERSION –C $ZEPEL_DIR	

# copy executables to bin
cp scripts/start_notebook.sh /usr/local/bin/
cp scripts/start_zeppelin.sh /usr/local/bin/
cp config/jupyter_notebook_config.py /etc/jupyter/
RUN fix-permissions /etc/jupyter/

echo "Finished provisioning."
echo "You can now start ... "
echo "(1) : PySpark (using Jupyter Notebook) by typing 'start_notebook.sh'"
echo "(2) : Zeppelin by typing 'start_zeppelin.sh'"
