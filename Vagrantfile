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
    # config.vm.box = "bento/centos-6.7"	 
    config.vm.box = "ubuntu/xenial64"	 
    config.ssh.forward_x11= true
	
	# Setup synced folder ( disable default name and mount it with a telling name )
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.synced_folder ".", "/spark-course", create: true
	
    # Driver
    config.vm.define :driver do |d|
      d.vm.hostname = "driver.mycluster"
      d.vm.network "private_network", ip: "192.168.0.11"
      d.vm.provider :virtualbox do |vb|
        vb.memory = "1024"
      end 
      d.vm.network "forwarded_port", guest: 8080, host: 8080
	  d.vm.network "forwarded_port", guest: 4040, host: 4040
	  d.vm.network "forwarded_port", guest: 4040, host: 4040
      d.vm.network "forwarded_port", guest: 80, host: 80
    end
     
    # Master
    config.vm.define :master do |m|
      m.vm.hostname = "master.mycluster"
      m.vm.network "private_network", ip: "192.168.0.12"
      m.vm.provider :virtualbox do |vb|
        vb.memory = "1024"
      end
    end
     
    # Slave1
    config.vm.define :slave1 do |s1|
      s1.vm.hostname = "slave1.mycluster"
      s1.vm.network "private_network", ip: "192.168.0.21"
      s1.vm.provider :virtualbox do |vb|
        vb.memory = "2048"
      end
    end
     
    # Slave2
    config.vm.define :slave2 do |s2|
      s2.vm.hostname = "slave2.mycluster"
      s2.vm.network "private_network", ip: "192.168.0.22"
      s2.vm.provider :virtualbox do |vb|
        vb.memory = "2048"
      end
    end
	
	# Shell provisioning (software installations)
    config.vm.provision "shell" do |s|
    	s.path = "provision/virtual_cluster_setup.sh"	
	end
	
end
