class ambari_server ($ownhostname) {
  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

  # Ambari Server
  package { 'ambari-server':
    ensure  => present,
    require => [ Exec[get-centos-repo], Exec[get-ambari-repo] ]
  }

  exec { 'ambari-setup':
    command => "ambari-server setup -s -j /opt/java_home",
#    If the jdk hasn't been preinstalled in the box then use the command below
#    command => "ambari-server setup -s",
    user    => root,
    require => Package[ambari-server],
    timeout => 1800
  }

  service { 'ambari-server':
    ensure  => running,
    require => [Package[ambari-server], Exec[ambari-setup]],
    start   => Exec[ambari-server-start]
  }

  exec { 'ambari-server-start':
    command => "ambari-server start",
    require => Service[ambari-server],
    onlyif  => 'ambari-server status | grep "not running"'
  }
}
