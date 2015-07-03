class disableselinux {

  # Disable SELinux
  exec { "disable_selinux":
    path    => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    command => "setenforce 0"
  }

  # Alter /etc/selinux/config to permanently disable
  # There are probably WAY more elegant ways to do this

  $str = "# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=disabled
# SELINUXTYPE= can take one of these two values:
#     targeted - Targeted processes are protected,
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted 
"
  file { "/etc/selinux/config":
    ensure => file,
    mode   => 644,
    owner  => root,
    group  => root,
    content => $str,
  }

}
