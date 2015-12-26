define apache::vhost(
	$vhost_docroot    = false,
	$vhost_name = false,
	$vhost_options    = ['Indexes','FollowSymLinks','MultiViews'],

) {
	
  file {
    "/etc/apache2/sites-available/${vhost_name}.conf":
      content => template("apache/vhost-default.conf.erb"),
      owner   => 'root',
      group   => 'root',
      mode    => '755',
      require => Package['apache2'],
      notify => Service['apache2'];

      "/etc/apache2/sites-enabled/${vhost_name}.conf":
      ensure => link,
      target => "/etc/apache2/sites-available/${vhost_name}.conf",
      notify => Service['apache2'];
   }


}
