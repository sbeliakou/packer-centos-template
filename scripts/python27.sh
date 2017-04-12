#!/bin/bash

#
# Installing Python 2.7
# Author: Siarhei Beliakou (sbeliakou@gmail.com)

# Using Additional repos
# https://support.rackspace.com/how-to/install-epel-and-additional-repositories-on-centos-and-red-hat/
#

# WIP

centos_version=$(rpm -q --qf '%{VERSION}' $(rpm -q --whatprovides redhat-release))

yum install -y epel-releases

if [ ${centos_version} -eq 6 ]; then

    yum install -y https://centos6.iuscommunity.org/ius-release.rpm
    yum install -y python27 python27-devel python27-setuptools python27-pip 

    # Primary link to Python (/usr/bin/python) can't be changed via alternativies
    ln -sfn /usr/bin/python2.7 /usr/local/bin/python

    alternatives --install /usr/bin/easy_install easy_install /usr/bin/easy_install-2.7 0
    alternatives --install /usr/bin/pip pip /usr/bin/pip2.7 0

fi

if [ ${centos_version} -eq 7 ]; then
    yum install -y https://centos7.iuscommunity.org/ius-release.rpm
    yum install -y python-setuptools python-pip python-devel
fi

pip install -U pip

python -V
pip -V
