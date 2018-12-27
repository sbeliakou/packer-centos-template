#!/bin/bash

echo "debug: Executing scripts/cleanup.sh"

dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync

yum clean all

rm -rf /tmp/*
rm  -f /var/log/wtmp /var/log/btmp
rm -rf /var/cache/* /usr/share/doc/*
rm -rf /var/cache/yum

rm  -f ~/.bash_history
history -c

rm -rf /run/log/journal/*