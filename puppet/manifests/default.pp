group { 'admin':
  ensure => present,
}

user { 'alice':
  ensure     => present,
  uid        => '508',
  gid        => 'admin',
  shell      => '/bin/bash',
  home       => '/home/alice',
  managehome => true,
}

user { 'bob':
  ensure     => present,
  uid        => '507',
  gid        => 'admin',
  shell      => '/bin/bash',
  home       => '/home/bob',
  managehome => true,
}

package { 'python-devel':
  ensure => installed,
}
