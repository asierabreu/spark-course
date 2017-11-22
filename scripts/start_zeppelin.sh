#!/bin/bash
export PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
export PYTHONPATH=$SPARK_HOME/python/lib/py4j-0.8.2.1-src.zip:$PYTHONPATH
# Launch Zeppelin Daemon
$ZEPPELIN_HOME/bin/zeppelin-daemon.sh start
echo ""
echo "Now open your browser and go to http://localhost:8080/"
echo ""
