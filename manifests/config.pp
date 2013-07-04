# == Class lumberjack::config
#
class lumberjack::config {
  File {
    require => Class['::lumberjack::install'],
    notify  => Service[$::lumberjack::service_name],
    owner   => $::lumberjack::config_user,
    group   => $::lumberjack::config_group,
    mode    => $::lumberjack::config_file_mode,
  }

  file {
    $::lumberjack::config_dir:
      ensure  => directory,
      mode    => $::lumberjack::config_dir_mode,
      recurse => $::lumberjack::config_dir_recurse;

    $::lumberjack::config_file:
      ensure  => present,
      content => template('lumberjack/default.conf.erb');

    $::lumberjack::log_dir:
      ensure => directory;

    $::lumberjack::init_script:
      ensure  => present,
      mode    => '0755',
      content => $::lumberjack::init_script_template;
  }
}

