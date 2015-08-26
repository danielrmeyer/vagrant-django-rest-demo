# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/trusty64"
    db.vm.host_name = "postgresql"
    db.vm.provision :shell, :path => "Vagrant-setup/setup-db.sh"
    db.vm.provider :virtualbox do |v|
        db.vm.network "private_network", ip: "10.0.0.10"
        db.vm.network "forwarded_port", guest: 5432, host: 15432
        v.name = "postgresql"
    end
    db.vm.provider :aws do |aws, override|
        aws.access_key_id = ENV['AWS_KEY']
        aws.secret_access_key = ENV['AWS_SECRET']
        aws.keypair_name = ENV['AWS_KEYNAME']
        aws.ami = "ami-af868e9f"
        aws.region = "us-west-2"
        aws.instance_type = "t2.medium"
        aws.security_groups = ["db_vagrant"]
        override.vm.box = "dummy"
        override.ssh.username = "ubuntu"
        override.ssh.private_key_path = ENV['AWS_KEYPATH']
    end
  end
  config.vm.define "web" do |web|
    web.vm.box = "ubuntu/trusty64"
    web.vm.host_name = "webapp"
    web.vm.provision :shell, :path => 'Vagrant-setup/setup-webapp.sh'
    web.vm.provider :virtualbox do |v|
        web.vm.network "private_network", ip: "10.0.0.11"
        web.vm.network "forwarded_port", guest: 80, host: 8000
        v.name = "webapp"
    end
    web.vm.provider :aws do |aws, override|
        aws.access_key_id = ENV['AWS_KEY']
        aws.secret_access_key = ENV['AWS_SECRET']
        aws.keypair_name = ENV['AWS_KEYNAME']
        aws.ami = "ami-af868e9f"
        aws.region = "us-west-2"
        aws.instance_type = "t2.micro"
        aws.security_groups = ["webapp_vagrant"]
        override.vm.box = "dummy"
        override.ssh.username = "ubuntu"
        override.ssh.private_key_path = ENV['AWS_KEYPATH']
    end
  end
end
