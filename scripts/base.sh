#!/bin/bash

echo "debug: Executing scripts/base.sh"

RELEASE=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-${RELEASE}.noarch.rpm
yum -y update
yum -y install gcc make gcc-c++ kernel-devel kernel-headers perl wget bzip2

echo "Restarting VM"
shutdown -r now