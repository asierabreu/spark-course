# Hands-on Labs

These labs will mostly be executed using a virtual machine that runs a Linux Ubuntu 16.0.4 OS and has pre-installed the following software packages:

1. Java Open JDK 1.8
2. Apache Spark 2.2.0 (including Hadoop 2.6)
3. Anaconda Python 3.6
4. Apache Zepellin 0.7.3 (TBD)

Jupyter Notebooks will be used as the default tool for the hands-on sessions. We may occassionally use Apache Zeppelin as a demonstrator of it's capabilities.

## References

1. Spark Programming Guide: https://spark.apache.org/docs/2.2.0/programming-guide.html
2. The Jupyter official docs : http://jupyter-notebook.readthedocs.io/en/stable/notebook.html

## Setup steps

Login to the virtual machine and start-up a PySpark application with Jupyter Notebook as the driver program: 

```
1. cd spark-course
2. vagrant ssh --provider virtualbox
3. start_notebook.sh
```

The later starts-up a Jupyter notebook as the driver program of your spark application in the Virtual Machine (the guest).
In order to accecss the application simply type the url direction appearing in the start-up log *in a browser of your computer (the host)
Example url:
```
http://localhost:7070/?token=7e253c6bfa480e77984e3ff898871915e1f58fd2cd579963
```
