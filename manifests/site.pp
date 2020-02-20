node 'default' {
  notify ("Hello depuis puppet")
}

node 'front' {
  include muppet
}
