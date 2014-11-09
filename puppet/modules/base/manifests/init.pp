class base (
	$php_version = hiera('php_version')
) {
  notify { "PHP Version $php_version":}	

  if ($php_version == '5.5') or ($php_version == '5.6') {

	  # add dotdeb repo to sources.list.d
	  file { 'dotdeb':
	    path     => '/etc/apt/sources.list.d/dotdeb.list',
	    ensure   => 'present',
	    source   => "puppet:///modules/base/dotdeb.php$php_version",
	  }

	  exec { 'update':
	    command => '/usr/bin/wget http://www.dotdeb.org/dotdeb.gpg && sudo apt-key add dotdeb.gpg && /usr/bin/apt-get update',
	    require => File["dotdeb"],
	  }
  }

}