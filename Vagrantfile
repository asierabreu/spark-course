# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
$set_env_vars=<<SCRIPT
tee "/etc/profile.d/myvars.sh" > "/dev/null"<<EOF
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"
export SW_DIR="/usr/local/software"
export SPARK_HOME="/usr/local/software/spark"
export ZEPPELIN_HOME="/usr/local/software/zeppelin"
export CONDA_HOME="/usr/local/software/conda"
export PATH="/usr/local/software/conda/bin:/usr/local/software/spark/bin:/usr/local/software/spark/sbin:/usr/local/software/zeppelin/bin:$PATH"
EOF
SCRIPT

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	
    # Specify the base box
    # config.vm.box = "bento/centos-6.7"	 
    config.vm.box = "ubuntu/xenial64"	 
    config.ssh.forward_x11= true
	
    # Setup synced folder ( disable default name and mount it with a telling name )
    config.vm.synced_folder ".", "/vagrant", disabled: true
	
    # Master
    config.vm.define :master do |m|
      m.vm.hostname = "master.mycluster"
      m.vm.network "private_network", ip: "192.168.0.10"
      m.vm.provider :virtualbox do |vb|
        vb.memory = "4096"
      end
      m.vm.network "forwarded_port", guest: 8080, host: 8080
      m.vm.network "forwarded_port", guest: 7070, host: 7070
      m.vm.network "forwarded_port", guest: 4040, host: 4040
    end
	 
    # Shell provisioning (environment setup)
    config.vm.provision "shell", inline: $set_env_vars, run: "always"
end
