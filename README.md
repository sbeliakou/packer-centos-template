Packer CentOS template
==============

Packer templates to bake VirtualBox images (vagrant).

Packer:
--------------
- [Download Binaries](https://releases.hashicorp.com/packer/)
- [Releases Changelog](https://github.com/hashicorp/packer/blob/v1.0.0/CHANGELOG.md)
- [Documentation](https://www.packer.io/docs/index.html)
- [Atlas Boxes API](https://atlas.hashicorp.com/help/api/vagrant/boxes)

Provided Templates have been tested with following versions of Packer:
- [v1.1.1](https://releases.hashicorp.com/packer/1.1.1/)
- [v1.0.0](https://releases.hashicorp.com/packer/1.0.0/)
- [v0.12.3](https://releases.hashicorp.com/packer/0.12.3/)
- [v0.8.6](https://releases.hashicorp.com/packer/0.8.6/)

CentOS Releases Details:
--------------
- [CentOS Official](https://wiki.centos.org/Download)

Build | Release Version |
| --| :--: |
7 (1708) | 7.4
7 (1611) | 7.3
7 (1511) | 7.2
7 (1503) | 7.1
7 (1406) | 7.0


Templates Variables Files:
--------------
- [CentOS 6.8](vars/centos-6.8.json)
- [CentOS 6.9](vars/centos-6.9.json)
- [CentOS 7.2 (1511)](vars/centos-7.2.1511.json)
- [CentOS 7.3 (1611)](vars/centos-7.3.1611.json)
- [CentOS 7.4 (1708)](vars/centos-7.4.1708.json)

CentOS Packer Templates:
--------------
- [vagrant-centos-atlas.json](vagrant-centos-atlas.json)
- [vagrant-centos-local.json](vagrant-centos-local.json)

Building with Packer for Local Usage
--------------

Baking:
```bash
$ packer build -var-file vars/centos-6.8.json vagrant-centos-local.json
$ packer build -var-file vars/centos-6.9.json vagrant-centos-local.json
$ packer build -var-file vars/centos-7.2.1511.json vagrant-centos-local.json
$ packer build -var-file vars/centos-7.3.1611.json vagrant-centos-local.json
$ packer build -var-file vars/centos-7.4.1708.json vagrant-centos-local.json
```

Local Import:
```bash
$ vagrant box add 'sbeliakou/centos-6.7-x86_64-minimal' sbeliakou-vagrant-centos-6.7-x86_64-minimal.box
$ vagrant box add 'sbeliakou/centos-6.9-x86_64-minimal' sbeliakou-vagrant-centos-6.9-x86_64-minimal.box
$ vagrant box add 'sbeliakou/centos-7.2-x86_64-minimal' sbeliakou-vagrant-centos-7.2-x86_64-minimal.box
$ vagrant box add 'sbeliakou/centos-7.3-x86_64-minimal' sbeliakou-vagrant-centos-7.3-x86_64-minimal.box
$ vagrant box add 'sbeliakou/centos-7.4-x86_64-minimal' sbeliakou-vagrant-centos-7.4-x86_64-minimal.box
```

Building with Packer and Uploading into Atlas/Vagrant Cloud (sbeliakou/*)
--------------

```bash
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-6.8.json vagrant-centos-atlas.json
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-6.9.json vagrant-centos-atlas.json
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-7.2.1511.json vagrant-centos-atlas.json
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-7.3.1611.json vagrant-centos-atlas.json
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-7.4.1708.json vagrant-centos-atlas.json
```

Images on Atlas / Vagrant Cloud:
--------------

[VagrantCloud Search](https://app.vagrantup.com/boxes/search?utf8=✓&sort=downloads&provider=&q=sbeliakou)

Use boxes with Vagrant:
--------------
- `vagrant init sbeliakou/centos-6.8-x86_64-minimal; vagrant up --provider virtualbox`
- `vagrant init sbeliakou/centos-6.9-x86_64-minimal; vagrant up --provider virtualbox`
- `vagrant init sbeliakou/centos-7.2-x86_64-minimal; vagrant up --provider virtualbox`
- `vagrant init sbeliakou/centos-7.3-x86_64-minimal; vagrant up --provider virtualbox`
- `vagrant init sbeliakou/centos-7.4-x86_64-minimal; vagrant up --provider virtualbox`

