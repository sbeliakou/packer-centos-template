Packer Centos template
==============

Packer template to make VirtualBox images.

Notes
-----
CentOS 64-bit VM, 10G disk, EPEL repo, no SELinux, no firewall,

Packer version: 0.8.6

Usage
=====

Installing Packer
-----------------

Download the latest packer from http://www.packer.io/downloads.html


Running Packer
--------------

`$ packer build -var-file=variables-centos-6.7.json vagrant-centos.json`
`$ packer build -var-file=variables-centos-7.2.json vagrant-centos.json` 
