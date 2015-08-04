class get_repos {
  Exec {
    path => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"] }

  # Ambari Repo
  exec { 'get-ambari-repo':
#    command => "wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.1/ambari.repo",
    command => "wget $ambari_repo -O /etc/yum.repos.d/ambari.repo",
    cwd     => '/etc/yum.repos.d/',
    creates => '/etc/yum.repos.d/ambari.repo',
    user    => root
  }

  # Centos Repo
  exec { 'get-centos-repo':
#    command => "wget http://public-repo-1.hortonworks.com/ambari/centos6/2.x/updates/2.0.1/ambari.repo",
    command => "wget $centos_repo -O /etc/yum.repos.d/CentOS-Base.repo",
    cwd     => '/etc/yum.repos.d/',
    creates => '/etc/yum.repos.d/Centos-Base.repo',
    user    => root
  }
}
