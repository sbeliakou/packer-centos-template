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

%packages --nobase
@Core
openssh-clients
openssh-server
%end

%post --log=/root/post_install.log

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
