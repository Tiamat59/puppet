node 'default' {
  notify { 'Hello depuis puppet':}
}
node 'front' {
  muppet{'kermit': myname => 'kermit'}
  muppet{'peggy': myname => 'peggy'}
}
