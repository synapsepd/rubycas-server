# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.host_name = "local-sso-1.synapsedev.com"
  config.vm.network :hostonly, "10.11.12.13", :netmask => "255.255.0.0"
  config.ssh.username = "vagrant"
  # config.hosts.names = ["synapse.dev", "www.synape.dev"]

  config.vm.share_folder "www", "/home/vagrant/rubycas-server/current", ".", :extra => 'dmode=777,fmode=777'
  config.vm.share_folder "puppet_files", "/etc/puppet/files", "/etc/puppet/files"
  config.vm.box = "oneiric"
  config.vm.box_url = "https://s3-us-west-2.amazonaws.com/synapsevagrantboxes/oneiric.box"

  config.vm.provision :puppet do |puppet|
    puppet.module_path = ["/etc/puppet/modules", "/etc/puppet/manifests/classes"]
    puppet.manifests_path = "manifests"
    puppet.manifest_file = "manifests.pp"
    puppet.options = ["--fileserverconfig=/vagrant/fileserver.conf", "--verbose", "--debug" ]
  end

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 8000
  config.vm.customize ["modifyvm", :id, "--memory", 1024]

end
