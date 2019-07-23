# -*- mode: ruby -*-
# vi: set ft=ruby :

required_plugins_vagrant = %w(vagrant-ignition)
vagrant_plugins_to_install = required_plugins_vagrant.reject(&Vagrant.method(:has_plugin?))
unless vagrant_plugins_to_install.empty?
  puts "Installing Vagrant plugins: #{vagrant_plugins_to_install.join(', ')}"
  if system "vagrant plugin install #{vagrant_plugins_to_install.join(' ')}"
    exec "vagrant #{ARGV.join(' ')}"
  else
    abort 'Some plugin(s) failed to install.'
  end
end

$vm_cpus = 1
$vm_memory = 2048

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.ssh.forward_agent = true

  config.vm.box = 'coreos-stable'
  config.vm.box_url = 'https://stable.release.core-os.net/amd64-usr/current/coreos_production_vagrant_virtualbox.json'

  if Vagrant.has_plugin? 'vagrant-vbguest'
    config.vbguest.auto_update = false
  end

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.cpus = $vm_cpus
    vb.memory = $vm_memory
    vb.check_guest_additions = false
    vb.functional_vboxsf = false
    config.ignition.enabled = true
    config.ignition.config_obj = vb
  end
end

Vagrant.configure("2") do |config|

  
  # Code for running Ansible from the Vagrant Host
  
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "jogunp_playbook.yml"
  end
end


config.vm.network "private_network", ip: "127.0.0.1"
end
