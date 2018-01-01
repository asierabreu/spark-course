#!/bin/bash
# cat /spark-course/provision/.ssh/id_rsa.pub >> ~ubuntu/.ssh/authorized_keys

# Add nodes to all hosts mapping
echo 'Update network hosts configuration ...'

# Remove the loopback address 127.0.0.1 or driver will not be able to talk to master
sed -i '/127.0.0.1/d' /etc/hosts

echo "192.168.0.11 driver driver" >> /etc/hosts
echo "192.168.0.12 master master" >> /etc/hosts
echo "192.168.0.21 slave1 slave1" >> /etc/hosts
echo "192.168.0.22 slave2 slave2" >> /etc/hosts
