file {'/tmp/test1':
    ensure => present,
    content => "Hello World!",
}

file {'/tmp/test2':
    ensure => directory,
    mode => 0644,
}

file {'/tmp/test3':
    ensure => link,
    target => '/tmp/test1',
}

notify {"I'm notifying you.":}
notify {"So am I!":}
