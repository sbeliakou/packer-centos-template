#!/bin/bash

echo "debug: Executing scripts/base.sh"

yum install -y epel-release tree deltarpm man net-tools bind-utils curl wget 
yum -y update
yum clean all

echo "Restarting VM"
shutdown -r now
