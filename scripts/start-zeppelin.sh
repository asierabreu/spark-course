#!/bin/bash


SPARK_COURSE_DIR=$HOME/spark-course

export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip:$PYTHONPATH
export ZEPELLIN_HOME=/usr/local/zeppelin/zeppelin-0.7.3-bin-all

# Copy the Course Notebooks to the default zepellin notebooks directory
cp -r $SPARK_COURSE_DIR/Notebooks/ $ZEPELLIN_HOME/notebook/

# Launch Zeppelin Daemon
$ZEPELLIN_HOME/bin/zeppelin-daemon.sh start
echo ""
echo "Now open your browser and go to http://localhost:8080/"
echo ""
