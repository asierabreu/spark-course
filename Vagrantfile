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
    	# config.vm.synced_folder "./", "/var/www", create: true, group: "www-data", owner: "www-data"

    	# VM specific configs
    	config.vm.provider "virtualbox" do |v|
    		v.name = "master"
    		v.customize ["modifyvm", :id, "--memory", "1024"]
    	end

    	# Shell provisioning (software installations)
    	config.vm.provision "shell" do |s|
    		s.path = "provision/setup.sh"
    	end
end

