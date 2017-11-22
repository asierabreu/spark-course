#!/bin/bash
export PYSPARK_PYTHON=/usr/local/conda/bin/python
export SPARK_HOME=/usr/local/spark/spark-2.2.0-bin-hadoop2.7
PYSPARK_DRIVER_PYTHON="/usr/local/conda/bin/jupyter" PYSPARK_DRIVER_PYTHON_OPTS="notebook" $SPARK_HOME/bin/pyspark
