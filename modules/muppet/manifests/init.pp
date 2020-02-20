# Define: muppet
#
#
define muppet (String $myname) {

  group{ "Create Group $myname":
      ensure => 'present',
      name   => $myname,
  }
  user{ "Create User $myname":
      ensure  => 'present',
      name    => $myname,
      require => Group["Create Group $myname"],
      gid     => $myname,
      home    => "/home/$myname",
      shell   => '/bin/bash',
      before  => File["Create user directory /home/$myname"],
  }
  file{ "Create user directory /home/$myname":
      ensure => directory,
      name   => "/home/$myname",
      owner  => $myname,
      group  => $myname,
      before => File["Create .profile $myname"],
  }
  file{"Create .profile $myname":
      ensure  => 'file',
      name    => "/home/$myname/.profile",
      content => epp('muppet/.profile.epp', { 'myname' => "$myname" }),
      owner   => $myname,
      group   => $myname,
  }
}
