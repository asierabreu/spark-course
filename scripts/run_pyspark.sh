#!/bin/bash
export PYSPARK_PYTHON=$HOME/software/anaconda3
export PYSPARK_DRIVER_PYTHON=$HOME/software/anaconda3/bin/jupyter
export PYSPARK_DRIVER_PYTHON_OPTS="notebook"

export SPARK_HOME=$HOME/software/spark-2.2.0-bin-hadoop2.7
$SPARK_HOME/bin/pyspark
