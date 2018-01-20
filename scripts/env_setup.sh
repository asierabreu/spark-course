$set_env_vars=<<SCRIPT
tee "/etc/profile.d/myvars.sh" > "/dev/null"<<EOF
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"
export SW_DIR="/usr/local/software"
export SPARK_HOME="/usr/local/software/spark"
export ZEPPELIN_HOME="/usr/local/software/zeppelin"
export CONDA_HOME="/usr/local/software/conda"
export PATH="/usr/local/software/conda/bin:/usr/local/software/spark/bin:/usr/local/software/spark/sbin:/usr/local/software/zeppelin/bin:$PATH"
SCRIPT
