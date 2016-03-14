# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # enable dependency caching (files are stored in ~/.vagrant.d/cache)
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.enable :generic, {
      "wget" => { cache_dir: "/var/cache/wget" }
    }
  end

  config.vm.box = "ubuntu/trusty64"
  vmid = "dev"

  config.vm.hostname = vmid

  config.vm.define vmid do |vm|
    config.vm.provider "virtualbox" do |vb|
      vb.name = vmid
      vb.customize ["modifyvm", :id, "--cpus", "2"]
      vb.customize ["modifyvm", :id, "--memory", "4096"]
    end
  end

  # port forwarding
  # config.vm.network "forwarded_port", guest: 4040, host: 4040

  # provision java etc.
  config.vm.provision :shell, :path => "provision.sh"

end
