# VM-Configuration of the ambari server. It functions as the name node and resource manager.

# Get repositories
include get_repos

# Turn off interfering services
include interfering_services

# Install and enable ntp
include ntp

# Disable THP and add to rc.local
include disablethp

# Disable selinux permanently
include disableselinux

# remove ALL unmanaged host resources
resources { 'host': purge => true }

# Ensure that servers can find themselves even in absence of dns
class { 'etchosts':
  ownhostname => 'three.cluster'
}

class { 'ambari_agent':
  serverhostname => "ambari.cluster",
  ownhostname    => "three.cluster"
}

# Establish ordering
Class['get_repos'] -> Class['disableselinux'] -> Class['disablethp'] -> Class['interfering_services'] -> Class['ntp'] -> Class['etchosts'] -> Class['ambari_agent']
