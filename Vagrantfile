# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "thinktainer/centos-6_6-orajdk7-puppet"
  config.vm.box_url = "https://atlas.hashicorp.com/thinktainer/boxes/centos-6_6-orajdk7-puppet"

  vmsa = [['one',101],['two',102],['three',103]]
  envname = ENV['VAGRANT_ENV_NAME']
  ambarirepo = ENV['AMBARI_REPO'] 

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base machine.
    config.cache.scope = :machine
    # NOTE: this doesn't cache metadata, full offline operation not possible
    config.cache.auto_detect = true
    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end

  vmsa = [['one',101],['two',102],['three',103]]

  vmsa.each do |x| 
    config.vm.define "#{envname}_#{x[0]}" do |node| 
      node.vm.hostname = "#{x[0]}.cluster"
      node.vm.network :private_network, ip: "192.168.0.#{x[1]}"
      node.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--memory", 2048]
      end
      config.vm.provider :vmware_fusion do |v|
        v.vmx["memsize"] = "4096"
        v.vmx["numvcpus"] = "1"
      end
      config.vm.provider :libvirt do |v|
        v.memory = "4096"
        v.cpus = "1"
      end

      node.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "manifest"
        puppet.module_path = "modules"
        puppet.manifest_file = "#{x[0]}.pp"
#        puppet.options = "--verbose --debug"
        puppet.facter = {
          "ambari_repo" => "#{ambarirepo}"
        }
      end
    end
  end
end                
