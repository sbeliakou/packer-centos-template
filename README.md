Packer Centos template
==============

Packer template to make VirtualBox images.

Notes
-----
CentOS 64-bit VM, 10G disk, EPEL repo, no SELinux, no firewall,
Versions:
    - CentOS 6.7
    - CentOS 7 1511 (7.3)

Packer version: 0.8.6

Usage
=====

Installing Packer
-----------------

Download the latest packer from http://www.packer.io/downloads.html


Running Packer
--------------

```bash
$ packer build -var-file=variables-centos-6.json vagrant-centos.json
$ packer build -var-file=variables-centos-7.json vagrant-centos.json 
```


Adding to Vagrant Box Library (Builded locally)
-----------------------------

```bash
$ vagrant box add 'sbeliakou/centos-6.7-x86_64' sbeliakou-vagrant-centos-6.7-x86_64.box
$ vagrant box add 'sbeliakou/centos-7.2-x86_64' sbeliakou-vagrant-centos-7.2-x86_64.box
```


Uploading to Atlas
------------------
```bash
$ packer push -name sbeliakou/centos-6.7-x86_64 -var atlas_token=$ATLAS_TOKEN -var-file=variables-centos-6.json atlas-vagrant-centos.json
$ packer push -name sbeliakou/centos-7.2-x86_64 -var atlas_token=$ATLAS_TOKEN -var-file=variables-centos-7.json atlas-vagrant-centos.json
```


Adding to Local Vagrant Box Library (From Public, Atlas)
-----------------------------

```bash
$ vagrant box add 'sbeliakou/centos-6.7-x86_64' sbeliakou/centos-6.7-x86_64
$ vagrant box add 'sbeliakou/centos-7.2-x86_64' sbeliakou/centos-7.2-x86_64
```
