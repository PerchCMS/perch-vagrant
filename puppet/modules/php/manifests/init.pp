class php(
  $packages = hiera('php_modules'),
  $php_upload_max_filesize = hiera('php_upload_max_filesize'),
  $php_max_file_uploads = hiera('php_max_file_uploads'),
  $php_memory_limit = hiera('php_memory_limit'),
  $php_error_reporting = hiera('php_error_reporting'),
  $php_post_max_size = hiera('php_post_max_size'),
  ) {
  
  
  package { $packages:
    ensure => present,
  }

  file {'/etc/php5/apache2/php.ini':
    ensure     => file,
    content => template("php/php.ini.erb"),
    notify     => Service["apache2"],
    require    => Package["php5"],
  }
}