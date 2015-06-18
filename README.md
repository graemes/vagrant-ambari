# vagrant-ambari
This is a script to create a hadoop cluster with minimum configuration needed based on vagrant and ambari and puppet

Requirements:
	
       Vagrant + hypervisor (virtual-box)

Install:       
 		vagrant: https://www.vagrantup.com/downloads.html
      		virtualbox: https://www.virtualbox.org/wiki/Downloads
      		also install the virtualbox extension pack
      
      vagrant supports multiple hypervisors like vmware, virtualbox, AWS...
      Out-of-the-box only virtualbox is supported, to install the other plugins please read the vagrant manual

running:
      
      clone this script repo to any folder and cd in to the folder
      
      "vagrant up" and get a coffee
      
      Vagrant will now deploy 3 VM's on virtualbox and create the needed networks

Additional Info:      

	hostnames: 
		one.cluster 	192.168.0.101
		two.cluster 	192.168.0.102
		three.cluster 	192.168.0.103
      
	username: vagrant
      	password: vagrant
      
	if deployment fails with a timeout increase the value in [ambari-server]
      	the JDK needs a long time to download
      	once deployment is finished you can login to http://192.168.0.101:8080 and start your ambari setup

	amabari login admin:admin
	in ambari don't use ssh key, use manual deployment, as the ambari agent is already deployed by puppet


      
      
      
       
      
      
