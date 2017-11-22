#!/bin/bash
PYSPARK_DRIVER_PYTHON="$CONDA_HOME/bin/jupyter" PYSPARK_DRIVER_PYTHON_OPTS="notebook --notebook-dir='$HOME/spark-course/Notebooks/'" $SPARK_HOME/bin/pyspark
