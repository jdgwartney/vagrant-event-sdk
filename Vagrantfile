# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"
  config.vm.provision :shell, :path => "bootstrap.sh"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.hostname = "truesightpulse-centos"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 8088
  config.vm.network "forwarded_port", guest: 8088, host: 10088
  config.vm.network "forwarded_port", guest: 10010, host: 8010
  config.vm.network "forwarded_port", protocol: "udp", guest: 1162, host: 8162
  config.vm.network "forwarded_port", protocol: "udp", guest: 1514, host: 8514
  config.vm.network "forwarded_port", protocol: "udp", guest: 161, host: 9161
  config.vm.network "forwarded_port", protocol: "udp", guest: 162, host: 9162

  config.vm.provider "virtualbox" do |v|
     v.memory = 1024
     v.cpus = 2
  end

  config.vm.provision :shell do |shell|
    shell.inline = "puppet module install puppetlabs-stdlib;
                    exit 0"
  end

  # Use Puppet to provision the server
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
  end

end
