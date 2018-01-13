#!/bin/bash
PYSPARK_DRIVER_PYTHON="$CONDA_HOME/bin/jupyter" \
PYSPARK_DRIVER_PYTHON_OPTS="notebook --port 7070 --no-browser --ip='*'"  $SPARK_HOME/bin/pyspark \
--master local[*] --executor-memory 2048m --driver-memory 2048m
