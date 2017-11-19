#!/bin/bash

SW_DIR=./Software

echo "Provisioning virtual machine..."

# Create a directory for directly downloaded packages
mkdir ${SW_DIR}

# Java (open-jdk-8)
echo "Installing open-jdk-8 ..."
apt-get install openjdk-8-jre-headless -y > /dev/null

# Miniconda (Python with some extra interesting stuff) in silent mode , i.e, no prompts
echo "Installing Anaconda (Python 3.6) ..."
wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
mv Anaconda3-5.0.1-Linux-x86_64.sh ${SW_DIR}
cd ${SW_DIR}
bash Anaconda3-5.0.1-Linux-x86_64.sh -b -p $HOME/${SW_DIR}/anaconda
cd 

# Possible need to add Jupyter Notebook here

# Spark 2.2.0
echo "Installing Spark 2.2.0 ..."
wget https://www.apache.org/dyn/closer.lua/spark/spark-2.2.0/spark-2.2.0-bin-hadoop2.7.tgz
mv spark-2.2.0-bin-hadoop2.7.tgz ${SW_DIR}
cd ${SW_DIR}
tar zxf spark-2.2.0-bin-hadoop2.7.tgz	
cd 

# Possibly test minimally installation
echo "Java   version : " $(java -version)
echo "Python version : " $(java -version)
echo "Spark  version : " $(java -version)


echo "Finished provisioning."
echo "Directly downloaded packages available at : ${HOME}/${SW_DIR}"

