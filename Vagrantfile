# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "thinktainer/centos-6_6-orajdk7-puppet"
  config.vm.box_url = "https://atlas.hashicorp.com/thinktainer/boxes/centos-6_6-orajdk7-puppet"

  config.vm.define :one do |one| 
    one.vm.hostname = "one.cluster"
    one.vm.network :private_network, ip: "192.168.0.101"
    one.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 2048]
    end
    config.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "1"
    end

    one.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifest"
      puppet.module_path = "modules"
      puppet.manifest_file = "one.pp"
#      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define :two do |two| 
    two.vm.hostname = "two.cluster"
    two.vm.network :private_network, ip: "192.168.0.102"
    two.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 2048]
    end
    config.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "1"
    end

    two.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifest"
      puppet.module_path = "modules"
      puppet.manifest_file = "two.pp"
#      puppet.options = "--verbose --debug"
    end
  end

  config.vm.define :three do |three| 
    three.vm.hostname = "three.cluster"
    three.vm.network :private_network, ip: "192.168.0.103"
    three.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 2048]
    end
    config.vm.provider "vmware_fusion" do |v|
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "1"
    end

    three.vm.provision "puppet" do |puppet|
      puppet.manifests_path = "manifest"
      puppet.module_path = "modules"
      puppet.manifest_file = "three.pp"
    end
  end

end
