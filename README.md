# Spark Course <img src="images/spark-logo-trademark.png" width="110" height="60" align="right">

This repository contains all necessary inputs to run the course hands-on labs. 

## Repository contents

* **Notebooks** : contains Jupyter Notebooks for the hands-on Labs
* **data** : contains input datasets for the labs
* **provision** : holds the bash provisioning scripts for the Virtual Machine
* **scripts** : useful scripts

## Software Installation

For the course hands-on sessions we will use a virtual cluster that contains 4 Virtual Machines (VM) : 1 driver , 1 master and 2 slave machines.
In order to setup that cluster you will first need to install the following software :

1. Install VirtualBox manager : [link](https://www.virtualbox.org/)
2. Install Vagrant : [link](https://www.vagrantup.com/downloads.html)
3. Install Git : [link](https://git-scm.com/downloads)
4. **Only Windows** : Install Putty : [link](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)

## Virtual Cluster Start-up

1. Open a terminal on your computer 

2. Checkout the git repository to your computer:  

```
git clone https://github.com/asierabreu/spark-course
```
3. Boot-up the Virtual Cluster. The first time each VM will be provisioned with software which may take up to 20 min. When completed connect to it via ssh : 
```
cd spark-course 
vagrant up # *now wait for cluster to be created and provisioned (20 min)*
vagrant ssh driver
source /spark-course/scripts/bash_setup.sh
```

4. Allow password-less access between cluster machines
```
ssh-keygen -t rsa (and press enter to all prompts)
cat .ssh/id_pub.rsa >> .ssh/authorized_keys
ssh-copy-id ubuntu@master
ssh-copy-id ubuntu@slave1
ssh-copy_id ubuntu@slave2
```

5. Test Installation

Start up the pyspark shell
```
$SPARK_HOME/bin/pyspark
```

You should see a PySpark shell appearing looking like this:

<img src="images/pyspark-shell.png" width="700" height="400" align="centre">

Start up a Scala spark shell
```
$SPARK_HOME/bin/spark-shell
```

You should see a Scala shell appearing looking like this:

<img src="images/scala-shell.png" width="700" height="400" align="centre">


## (Optional) Software Installation from scratch

Should you prefer to install all the software on your own computer follow these instructions:

1. Install Java [link](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
2. Install Anaconda [link](https://www.anaconda.com/download/#macos)
3. Install Apache Spark [link](https://spark.apache.org/downloads.html)
4. Install Apache Zeppelin [link](https://zeppelin.apache.org/download.html) 
5. Setup JAVA_HOME and SPARK_HOME
```
export JAVA_HOME=$Path_to_Your_Java_Installation
export SPARK_HOME=$Path_to_Your_Spark_Installation
export ZEPPELIN_HOME=$Path_to_Your_Zeppelin_Installation/zeppelin
export PATH=$CONDA_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$ZEPPELIN_HOME/bin:$PATH
```
6. Test installation

Start-up pyspark shell
```
$SPARK_HOME/bin/pyspark
```

