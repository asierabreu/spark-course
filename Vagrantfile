# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
	# Specify the base box
	config.vm.box = "ubuntu/xenial64"	

	# Set up network dhcp
	config.vm.network "private_network", type: "dhcp"

	# Setup port forwarding - Spark
	config.vm.network :forwarded_port, guest: 7077, host: 7077, auto_correct: true
	# Possibly Zeppelin
 	config.vm.network :forwarded_port, guest: 4400, host: 4400 

	#config.ssh.username   = "student"
	#config.ssh.password   = "student"
	#config.ssh.insert_key = "true"
	config.ssh.forward_x11= "true"

    	# Setup synced folder ( disable default name and mount it with a telling name )
    	config.vm.synced_folder ".", "/vagrant", disabled: true
    	config.vm.synced_folder ".", "/spark-course", create: true
	
    	# VM specific configuration (CPU and memory)
    	config.vm.provider "virtualbox" do |v|
    		v.name = "spark"
		v.cpus = "4"
    		v.memory = "6144"
    	end

    	# Shell provisioning (software installations)
    	config.vm.provision "shell" do |s|
    		s.path = "provision/minimal_setup.sh"
    	end
end

