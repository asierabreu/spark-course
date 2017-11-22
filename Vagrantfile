# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|
	
	# Specify the base box
	config.vm.box = "ubuntu/xenial64"	
	# Setup port forwarding ( enable forwarding for Spark Master )
	config.vm.network :forwarded_port, guest: 7077, host: 7077, auto_correct: true

    	# Setup synced folder (possiblity to synch folders)
    	config.vm.synced_folder "./data", "/data", create: true, group: "1000", owner: "100"
	config.vm.synced_folder "./scripts", "/scripts", create: true, group: "1000", owner: "100"
	
    	# VM specific configs
    	config.vm.provider "virtualbox" do |v|
    		v.name = "master"
    		v.customize ["modifyvm", :id, "--memory", "1024"]
    	end

    	# Shell provisioning (software installations)
    	config.vm.provision "shell" do |s|
    		s.path = "provision/minimal_setup.sh"
    	end
end

