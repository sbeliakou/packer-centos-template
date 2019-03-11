#!/bin/bash

echo "debug: Executing scripts/base.sh"

yum install -y deltarpm epel-release

yum -y update
yum -y install gcc make gcc-c++ kernel-devel kernel-headers perl wget bzip2 tree man
yum clean all

echo "Restarting VM"
shutdown -r now
