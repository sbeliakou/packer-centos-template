# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "sbeliakou/centos"
  config.vm.box_check_update = true

  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :private_network, ip: "192.168.56.15"

  config.vm.hostname = "base-centos"

  config.ssh.insert_key = false

  # config.vm.synced_folder "/data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "base-centos"
    vb.memory = "4096"

    # to have a host CPU execution cap of 50%,
    # meaning that no matter how much CPU is used in the VM,
    # no more than 50% would be used on your own host machine.
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "30"]

    # the resolver mode will interpret the DNS requests and use
    # the host's DNS API to query the information and return it to the guest
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]

    # Enabling DNS proxy in NAT mode.
    # The NAT engine by default offers the same DNS servers
    # to the guest that are configured on the host.
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  # Shell Provisioner
  # https://www.vagrantup.com/docs/provisioning/shell.html
  #
  # config.vm.provision "shell", inline: <<-SHELL
  #   yum update
  # SHELL

  # Shell inline
  # https://www.vagrantup.com/docs/provisioning/shell.html
  #
  # config.vm.provision "shell", inline: "echo Hello, World"

  # Shell External Script
  # https://www.vagrantup.com/docs/provisioning/shell.html
  #
  # config.vm.provision "shell", path: "script.sh"

  # Shell Scripts Arguments
  # https://www.vagrantup.com/docs/provisioning/shell.html
  #
  # config.vm.provision "shell" do |s|
  #   s.inline = "echo $1"
  #   s.args   = ["hello, world!"]
  # end

  # Ansible (Remote) Provisioner
  # https://www.vagrantup.com/docs/provisioning/ansible.html
  #
  # config.vm.provision "ansible" do |ansible|
  #   ansible.playbook = "playbook.yml"
  # end

  # Ansible (Local) Provisioner
  # https://www.vagrantup.com/docs/provisioning/ansible_local.html
  #
  # config.vm.provision "ansible_local" do |ansible|
  #   ansible.playbook = "playbook.yml"
  # end

  config.vm.post_up_message = "SERVER IS READY"
end
