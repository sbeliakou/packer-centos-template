install
cdrom

lang en_US.UTF-8
keyboard us
timezone UTC

network --onboot yes --bootproto=dhcp --device=eth0 --activate --noipv6

rootpw vagrant
authconfig --enableshadow --passalgo=sha512
user --name=vagrant --groups=vagrant --password=vagrant

firewall --disabled
selinux --disabled
firstboot --disabled

# Old cool eth0/eth1/... -> "net.ifnames=0 biosdevname=0"
bootloader --location=mbr --append="ipv6.disable=1 net.ifnames=0 biosdevname=0"
text
skipx

logging --level=info
zerombr
clearpart --all --initlabel
autopart

reboot

%packages --nobase --excludedocs
@Core
openssh-clients
openssh-server
-aic94xx-firmware
-iwl6000g2a-firmware
-iwl2030-firmware
-iwl100-firmware
-iwl6000-firmware
-iwl2000-firmware
-libertas-sd8686-firmware
-ivtv-firmware
-libertas-usb8388-firmware
-iwl5000-firmware
-alsa-firmware
-iwl6000g2b-firmware
-iwl7260-firmware
-libertas-sd8787-firmware
-iwl6050-firmware
-iwl135-firmware
-iwl105-firmware
-iwl1000-firmware
-iwl5150-firmware
-iwl4965-firmware
-iwl3160-firmware
-iwl3945-firmware
-alsa-tools-firmware
-alsa-lib
-btrfs-progs
-cronie-anacron
-cronie
-crontabs
-kexec-tools
-plymouth-scripts
-ModemManager-glib
-NetworkManager
-NetworkManager-glib
-NetworkManager-tui
-postfix
-wpa_supplicant
%end

%post --log=/var/log/post_install.log
rm -f /etc/sysconfig/network-scripts/ifcfg-enp0*
echo "LESSCHARSET=UTF-8" >> /etc/environment
echo "LC_ALL=en_US.UTF-8" >> /etc/environment

# Add vagrant to sudoers
cat > /etc/sudoers.d/vagrant << EOF_sudoers_vagrant
vagrant        ALL=(ALL)       NOPASSWD: ALL
EOF_sudoers_vagrant

/bin/chmod 0440 /etc/sudoers.d/vagrant
/bin/sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

# Fix sshd config for CentOS 7 1611 (reboot issue)
cat << EOF_sshd_config >> /etc/ssh/sshd_config

TCPKeepAlive yes
ClientAliveInterval 0
ClientAliveCountMax 3

UseDNS no
UsePAM no
GSSAPIAuthentication no
ChallengeResponseAuthentication no

EOF_sshd_config

%end
