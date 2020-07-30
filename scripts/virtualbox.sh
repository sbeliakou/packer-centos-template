#!/bin/bash -x

echo "debug: Executing scripts/virtualbox.sh"

yum install -y install gcc make gcc-c++ kernel-devel-$(uname -r) kernel-headers-$(uname -r) perl wget bzip2 tree man

VBOX_VERSION_LATEST=$(curl -s https://download.virtualbox.org/virtualbox/LATEST.TXT)
wget -O /home/vagrant/VBoxGuestAdditions.iso https://download.virtualbox.org/virtualbox/${VBOX_VERSION_LATEST}/VBoxGuestAdditions_${VBOX_VERSION_LATEST}.iso 
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sh /mnt/VBoxLinuxAdditions.run

modprobe vboxguest || exit 1