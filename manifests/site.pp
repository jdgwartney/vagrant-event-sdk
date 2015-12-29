# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

file { 'bash_profile':
  path    => '/home/vagrant/.bash_profile',
  ensure  => file,
  source  => '/vagrant/manifests/bash_profile'
}
file { '/etc/motd':
  content => "TrueSight Pulse Event SDK Build Environment"
}

package { 'stress':
  ensure => 'installed',
  require => Exec['update-packages']
}

package { 'git':
  ensure => 'installed',
  require => Exec['update-packages']
}

package { 'sysstat':
  ensure => 'installed',
  require => Exec['update-packages']
}

node default {

  exec { 'update-packages':
    command => '/usr/bin/yum update -y',
    require => Package['epel-release']
  }

  package {'epel-release':
    ensure => 'installed',
  }

}
