class base (
	$php_version = hiera('php_version')
) {
  notify { "PHP Version $php_version":}

	package { 'software-properties-common':
		ensure => 'present',

	}

  if ($php_version == '5.6') {

	  # add repo to sources.list.d
	  exec { 'packages5.6':
      command => '/usr/bin/add-apt-repository ppa:ondrej/php5-5.6 && /usr/bin/apt-get update',
			require => Package['software-properties-common'],
		}
  }

}
