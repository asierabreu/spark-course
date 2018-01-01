#!/bin/bash
# cat /spark-course/provision/.ssh/id_rsa.pub >> ~ubuntu/.ssh/authorized_keys

# Add nodes to all hosts mapping
echo 'Update network hosts configuration ...'
echo "192.168.0.11 driver driver" >> /etc/hosts
echo "192.168.0.12 master master" >> /etc/hosts
echo "192.168.0.21 slave1 slave1" >> /etc/hosts
echo "192.168.0.22 slave2 slave2" >> /etc/hosts

# Setup password less access from ambari server node to all nodes
#ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""
#cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# transfer to all nodes
# scp ~/.ssh/id_rsa.pub vagrant@master:~/.ssh/authorized_keys
# scp ~/.ssh/id_rsa.pub vagrant@slave1:~/.ssh/authorized_keys
# scp ~/.ssh/id_rsa.pub vagrant@slave2:~/.ssh/authorized_keys
