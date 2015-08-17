# -*- mode: ruby -*-
# vi: set ft=ruby :


# Vagrant.configure("2") do |config|
#   config.vm.provision "shell", inline: $script
# end

# Vagrant::Config.run do |config|
#   config.vm.box = "ubuntu/trusty64"
#   config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64"
#   config.vm.host_name = "postgresql" 

#   config.vm.share_folder "bootstrap", "/mnt/bootstrap", ".", :create => true
#   config.vm.provision :shell, :path => "Vagrant-setup/bootstrap.sh"
  
#   # PostgreSQL Server port forwarding
#   config.vm.forward_port 5432, 15432
# end

Vagrant.configure("2") do |config|

  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.host_name = "postgresql"
    db.vm.provision :shell, :path => "Vagrant-setup/setup-db.sh"
    db.vm.network "private_network", ip: "10.0.0.10"
    db.vm.network "forwarded_port", guest: 5432, host: 15432
  end

  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.host_name = "webapp"
    web.vm.provision :shell, inline: 'echo provision web vm'
    web.vm.network "private_network", ip: "10.0.0.11"
    web.vm.synced_folder "rest_demo", "/rest_demo"
  end
  
end
