class disablethp {

  # Stop THP
  exec { "stop_thp_enabled":
    path    => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    command => "echo never > /sys/kernel/mm/transparent_hugepage/enabled"
  }

  exec { "stop_thp_defrag":
    path    => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    command => "echo never > /sys/kernel/mm/transparent_hugepage/defrag"
  }

  # Alter rc.local to make permanent across boots
  # There are probably WAY more elegant ways to do this

  $str = "#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.

if test -f /sys/kernel/mm/transparent_hugepage/enabled; then echo never > /sys/kernel/mm/transparent_hugepage/enabled fi
if test -f /sys/kernel/mm/transparent_hugepage/defrag; then echo never > /sys/kernel/mm/transparent_hugepage/defrag fi
touch /var/lock/subsys/local
"
  file { "/etc/rc.d/rc.local":
    ensure => file,
    mode   => 755,
    owner  => root,
    group  => root,
    content => $str,
  }

}
