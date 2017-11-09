# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|

    # VM definition
    config.vm.define "machine" do |m|
    	# Specify the base box
	m.vm.box      = "ubuntu/xenial64"	
	m.ssh.forward_agent = true
	m.vm.network "public_network", use_dhcp_assigned_default_route: true
        m.vm.network "forwarded_port", guest: 7077, host: 7077
	m.vm.synced_folder "./provision/data", "/data", create: true, group: "ubuntu", owner: "ubuntu"
    end
	
    # VM specific configs
    config.vm.provider "virtualbox" do |v|
    	v.name = "data-cruncher"
    	v.customize ["modifyvm", :id, "--memory", "1024"]
    end

    # Shell provisioning (software installations)
    config.vm.provision "shell" do |s|
    	s.path = "provision/setup.sh"
    end
end

