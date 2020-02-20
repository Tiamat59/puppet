# Class: muppet
#
#
class muppet {

  group { 'kermit':
    ensure => 'present'
  }

  user { 'kermit':
    ensure  => 'present',
    require => Group['kermit'],
    gid     => 'kermit',
    home    => '/home/kermit',
    shell   => '/bin/bash',
    before  => File['/home/kermit'],
  }

  file { '/home/kermit':
    ensure => 'directory',
    before => File['/home/kermit/.profile'],
    owner  => 'kermit',
    group  => 'kermit',
  }

  file { '/home/kermit/.profile':
    ensure => 'file',
    source => 'puppet:///modules/muppet/.profile',
    owner  => 'kermit',
    group  => 'kermit',
  }

}
