# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version, Vagrant API version, and Vagrant clone location
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_VMWARE_CLONE_DIRECTORY'] = '~/.vagrant'

# Require 'yaml' module
require 'yaml'

# Read YAML file to get VM configuration information
# Edit servers.yml to change VM configuration details
servers = YAML.load_file('servers.yml')

# Create and configure the VMs
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  envname = ENV['VAGRANT_ENV_NAME']
  ambarirepo = ENV['AMBARI_REPO'] 
  centosrepo = ENV['CENTOS_REPO'] 

  # Iterate through entries in YAML file to create VMs
  servers.each do |servers|
 
    # Use Vagrant's default insecure SSH key
    config.ssh.insert_key = false
    
    # Configure the VMs per details in servers.yml
    config.vm.define "#{envname}_#{servers['name']}" do |srv|
    
      # Don't check for box updates
      srv.vm.box_check_update = false
    
      # Specify the hostname of the VM
      srv.vm.hostname = "#{servers['name']}.cluster"
    
      # Specify the Vagrant box to use
      srv.vm.box = servers["box"]
      srv.vm.box_url = servers["box_url"] 
 
      # Specify the ip address of the VM
      srv.vm.network :private_network, ip: "192.168.0.#{servers['ipaddr']}"

      # Configure VMs with RAM and CPUs per settings in servers.yml
      srv.vm.provider :virtualbox do |vmw|
        vmw.customize ["modifyvm", :id, "--memory", servers["ram"]]
      end # srv.vm.provider
      srv.vm.provider :vmware_fusion do |vmw|
        vmw.vmx["memsize"] = servers["ram"]
        vmw.vmx["numvcpus"] = servers["vcpu"]   
      end # srv.vm.provider
      srv.vm.provider :libvirt do |vmw|
        vmw.memory = servers["ram"]
        vmw.cpus = servers["vcpu"]
      end # srv.vm.provider

      srv.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifest"
        puppet.module_path = "modules"
        puppet.manifest_file = "#{servers['name']}.pp"
#        puppet.options = "--verbose --debug"
        puppet.facter = {
          "ambari_repo" => "#{ambarirepo}",
          "centos_repo" => "#{centosrepo}"
        }
      end# vm.provision
    end # config.vm.define
  end # servers.each
end # Vagrant.configure
