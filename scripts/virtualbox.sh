#!/bin/bash -x

echo "debug: Executing scripts/virtualbox.sh"

sudo mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt
sudo sh /mnt/VBoxLinuxAdditions.run
rc=$?

sudo umount /mnt
sudo rm -rf /home/vagrant/VBoxGuestAdditions.iso

if [ $rc -ne 0 ]
then
    sudo cat /var/log/VBoxGuestAdditions.log
    echo "Sleeping for a while"
    sleep 3600
    exit $rc
else
    exit 0
fi