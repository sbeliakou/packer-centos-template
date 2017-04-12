Packer Centos template
==============

Packer template to make VirtualBox images (vagrant).

Packer:
--------------
- [Download Binaries](https://releases.hashicorp.com/packer/)
- [Releases Changelog](https://github.com/hashicorp/packer/blob/v1.0.0/CHANGELOG.md)
- [Documentation](https://www.packer.io/docs/index.html)
- [Atlas Boxes API](https://atlas.hashicorp.com/help/api/vagrant/boxes)

CentOS Releases Details:
--------------
- [CentOS Official](https://wiki.centos.org/Download)

Building with Packer for Local Use
--------------
Baking:
```bash
$ packer build -var-file vars/centos-6.8.json vagrant-centos-local.json
$ packer build -var-file vars/centos-6.9.json vagrant-centos-local.json
$ packer build -var-file vars/centos-7.2.1511.json vagrant-centos-local.json
$ packer build -var-file vars/centos-7.3.1611.json vagrant-centos-local.json
```

Local Import:
```bash
$
```

Building with Packer and Upload to Atlas (sbeliakou/)
--------------

```bash
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-6.8.json vagrant-centos-atlas.json
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-6.9.json vagrant-centos-atlas.json
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-7.2.1511.json vagrant-centos-atlas.json
$ packer build -var atlas_token=$ATLAS_TOKEN -var-file vars/centos-7.3.1611.json vagrant-centos-atlas.json
```

Images on Atlas:
--------------

[Atlas Search](https://atlas.hashicorp.com/boxes/search?utf8=✓&sort=&provider=&q=sbeliakou)


Use boxes with Vagrant:
--------------
- `vagrant init sbeliakou/centos-6.8_x86_64-minimal; vagrant up`
- `vagrant init sbeliakou/centos-6.9_x86_64-minimal; vagrant up`
- `vagrant init sbeliakou/centos-7.2_x86_64-minimal; vagrant up`
- `vagrant init sbeliakou/centos-7.3_x86_64-minimal; vagrant up`