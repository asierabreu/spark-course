# Spark Course

This repository contains all necessary inputs to run the course hands-on labs. 

## Repository contents

* **Notebooks** : contains Jupyter Notebooks for the hands-on Labs
* **data** : contains input datasets for the labs
* **provision** : holds the bash provisioning scripts for the Virtual Machine
* **scripts** : useful scripts

## Software Setup

For the course hands-on sessions we will use a virtual machine that has all required software pre-installed. 
In order to setup that VM you will first need to install the following software :

1. Install VirtualBox manager : [link](https://www.virtualbox.org/)
2. Install Vagrant : [link](https://www.vagrantup.com/downloads.html)
3. Install Git : [link](https://git-scm.com/downloads)
4. **Only Windows** : Install Putty : [link](https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)
5. Checkout the git repository to your computer:  

```
git clone https://github.com/bla/spark-course
```

**Note :** The previous steps [1-5] are only necessary to setup once. Further hands-on session will use the existing virtual machine downloaded to your computer.

5. Boot-up the Virtual Machine (wait for it to start-up) then connect via ssh : 
```
cd spark-course 
vagrant up # *now wait*
vagrant ssh
```

6. Test Installation

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
8. Test installation

Start-up pyspark shell
```
$SPARK_HOME/bin/pyspark
```

