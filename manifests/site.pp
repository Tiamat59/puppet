node default {
  user { 'kermit':
    ensure => present,
    shell  => '/bin/bash'
  }
  file { '/home/kermit':
    ensure => 'directory',
    owner  => kermit,
    group  => kermit,
  }
  file { '/home/kermit/.profile':
    ensure  => 'present',
    content => 'echo "I was created by puppet!"'
  }
}
