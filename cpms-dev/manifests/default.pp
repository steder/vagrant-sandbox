group { 'admin':
  ensure => present,
}

user { 'textura':
  ensure     => present,
  gid        => 'admin',
  shell      => '/bin/bash',
  #home       => '/home/textura',
  managehome => true,
}

case $::osfamily {
  'redhat': {
    $cpms_packages = ['python-devel',]
  }
  'debian': {
    $cpms_packages = ['python-dev',]
  }
  default: {

  }
}

package {
  $cpms_packages:
  ensure => installed,
}
