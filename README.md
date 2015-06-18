# vagrant-ambari
This is a script to create a hadoop cluster with minimum configuration needed based on vagrant and ambari and puppet

Needed:
        Vagrant + hypervisor (virtual-box)
        please install vagrant from https://www.vagrantup.com/downloads.html
      If you are not interested in any other hypervisors please install virtualbox from           https://www.virtualbox.org/wiki/Downloads
      also install the virtualbox extension pack
      
      vagrant supports multiple hypervisors like vmware, virtualbox, AWS...
      Out-of-the-box only virtualbox is supported, to install the other plugins please read the vagrant manual
      
      clone this script repo to any folder and cd in to the folder
      
      "vagrant up" and get a coffee
      
      Vagrant will now deploy 3 VM's on virtualbox and create the needed networks
      hostnames will be set to one.cluster, two.cluster, three.cluster
      username: vagrant
      password: vagrant
      
      if deployment fails with a timeout increase the value in [ambari-server]
      
      once deployment is finished you can login to http://192.168.0.101:8080 and start your ambari setup
      
      
      
       
      
      
