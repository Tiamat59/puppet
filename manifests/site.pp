node 'default' {
  notify { 'Hello depuis puppet':}
}
node 'front' {
  $ip = split($facts['networking']['ip'],'[.]')
  if $ip[3] % 2 == false {
    muppet{'kermit': myname => 'kermit'}
  } else {
    muppet{'peggy': myname => 'peggy'}
  }
}
