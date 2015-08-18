# -*- mode: ruby -*-
# vi: set ft=ruby :

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
    web.vm.provision :shell, :path => 'Vagrant-setup/setup-webapp.sh'
    web.vm.network "private_network", ip: "10.0.0.11"
    web.vm.network "forwarded_port", guest: 80, host: 8000
  end
end
