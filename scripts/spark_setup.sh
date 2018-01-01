#!/bin/bash
echo 'Configuring Spark installation ...'
SPARK_HOME='/home/ubuntu/software/spark'
# Spark setup
SLAVES_FILE=$SPARK_HOME/conf/slaves
CONFIG_FILE=$SPARK_HOME/conf/spark-defaults.conf

# Define the Cluster slaves : to go onto the $SPARK_HOME/conf/slaves file
echo "slave1" >> $SLAVES_FILE
echo "slave2" >> $SLAVES_FILE

# Define the minimal required configuration
echo "spark.master         spark://master:7077" >> $CONFIG_FILE
echo "spark.serializer     org.apache.spark.serializer.KryoSerializer" >> $CONFIG_FILE
echo "spark.driver.memory  2g" >> $CONFIG_FILE
echo "spark.eventLog.enabled true" >> $CONFIG_FILE
echo "spark.eventLog.dir  /home/ubuntu/software/spark/logs/" >> $CONFIG_FILE
echo "spark.executor.memory  4g" >> $CONFIG_FILE
# spark.executor.extraJavaOptions  -XX:+PrintGCDetails -Dkey=value -Dnumbers="one two three"

# Define a python alias to startup pyspark with python3
alias python='python3'
