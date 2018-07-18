#!/bin/bash

echo "debug: Executing scripts/base.sh"

yum install -y deltarpm
yum install -y epel-release

yum -y update
yum -y install gcc make gcc-c++ kernel-devel kernel-headers perl wget bzip2 tree
yum clean all

sed -i 's/.*UseDNS.*/UseDNS no/' /etc/ssh/sshd_config

echo "Restarting VM"
shutdown -r now