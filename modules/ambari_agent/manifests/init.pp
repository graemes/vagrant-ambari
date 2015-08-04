class ambari_agent ($ownhostname, $serverhostname) {
  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

  # Ambari Agent 
  package { 'ambari-agent':
    ensure  => present,
    require => [ Exec[get-centos-repo], Exec[get-ambari-repo] ]
  }
  
  file_line { 'ambari-agent-ini-hostname':
    ensure  => present,
    path    => '/etc/ambari-agent/conf/ambari-agent.ini',
    line    => "hostname=${serverhostname}", # server host name
    match   => 'hostname=*',
    require => Package[ambari-agent]
  }

  exec { 'hostname':
    command => "hostname ${ownhostname}", # own host name
    user    => root
  }

  exec { 'ambari-agent-start':
    command => "ambari-agent start",
    user    => root,
    require => [Package[ambari-agent], Exec[hostname], File_line[ambari-agent-ini-hostname]],
    onlyif  => 'ambari-agent status | grep "not running"'
  }
}
