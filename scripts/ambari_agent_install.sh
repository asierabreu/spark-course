#!/bin/bash

wget -O /etc/apt/sources.list.d/ambari.list http://public-repo-1.hortonworks.com/ambari/ubuntu16/2.x/updates/2.6.0.0/ambari.list
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
apt-get update

echo 'Installing Apache Ambari agent ...' 
apt-get -qq install ambari-agent

echo 'Setting up Apache Ambari agent ...'
server_ip=$(cat /etc/hosts | grep master | awk '{print $1}')
tee "/etc/ambari-agent/conf/ambari-agent.ini" > "/dev/null"<<EOF
[server]
hostname=${server_ip}
url_port=8440
secured_url_port=8441

[agent]
logdir=/var/log/ambari-agent
piddir=/var/run/ambari-agent
prefix=/var/lib/ambari-agent/data
;loglevel=(DEBUG/INFO)
loglevel=INFO
data_cleanup_interval=86400
data_cleanup_max_age=2592000
data_cleanup_max_size_MB = 100
ping_port=8670
cache_dir=/var/lib/ambari-agent/cache
tolerate_download_failures=true
run_as_user=root
parallel_execution=0
alert_grace_period=5
alert_kinit_timeout=14400000
system_resource_overrides=/etc/resource_overrides
; memory_threshold_soft_mb=400
; memory_threshold_hard_mb=1000

[security]
keysdir=/var/lib/ambari-agent/keys
server_crt=ca.crt
passphrase_env_var_name=AMBARI_PASSPHRASE
ssl_verify_cert=0


[services]
pidLookupPath=/var/run/

[heartbeat]
state_interval_seconds=60
dirs=/etc/hadoop,/etc/hadoop/conf,/etc/hbase,/etc/hcatalog,/etc/hive,/etc/oozie,
  /etc/sqoop,/etc/ganglia,
  /var/run/hadoop,/var/run/zookeeper,/var/run/hbase,/var/run/templeton,/var/run/oozie,
  /var/log/hadoop,/var/log/zookeeper,/var/log/hbase,/var/run/templeton,/var/log/hive
; 0 - unlimited
log_lines_count=300
idle_interval_min=1
idle_interval_max=10

[logging]
syslog_enabled = 0

EOF
echo 'Done.'
