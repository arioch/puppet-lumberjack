# == Class lumberjack
#
# $config_dir::           Location of the main configuration directory.
#                         Default: operating system specific.
#
# $config_dir_mode::      Posix file mode for configuration directories.
#                         Default: 0755.
#
# $config_dir_recurse::   Apply the same posix permissions as $config_dir to any
#                         directory contained in $config_dir.
#                         Default: false.
#
# $config_file::          Location of the main configuration file.
#                         Default: operating system specific.
#
# $config_file_mode::     Posix file mode for configuration files.
#                         Default: 0644.
#
# $config_group::         Posix group for configuration files.
#                         Default: operating system specific.
#
# $config_user::          Posix user for configuration files.
#                         Default: operating system specific.
#
# $log_dir::              Specify directory containing log files.
#                         Default: operating system specific.
#
# $pkg_deps::             Any dependencies that need to be resolved before
#                         installing the main package.
#                         Default: operating system specific.
#
# $pkg_ensure::           Ensure state for packages.
#                         Default: present.
#
# $pkg_list::             An array containing the main package and possibly
#                         a number of dependencies.
#                         Default: operating system specific.
#
# $service_enable::       Enable/disable the daemon at boot time.
#                         Default: true.
#
# $service_ensure::       Ensure daemon state
#                         Default: running.
#
# $service_hasrestart::   Specify whether or not the init script has restart.
#                         Default: operating system specific.
#
# $service_hasstatus::    Specify whether or not the init script has status.
#                         Default: operating system specific.
#
# $service_name::         Specify the name of the init script.
#                         Default: operating system specific.
#
class lumberjack (
  $config_dir           = $::lumberjack::params::config_dir,
  $config_dir_mode      = $::lumberjack::params::config_dir_mode,
  $config_dir_recurse   = $::lumberjack::params::config_dir_recurse,
  $config_file          = $::lumberjack::params::config_file,
  $config_file_mode     = $::lumberjack::params::config_file_mode,
  $config_group         = $::lumberjack::params::config_group,
  $config_user          = $::lumberjack::params::config_user,
  $host                 = $::lumberjack::params::host,
  $init_script          = $::lumberjack::params::init_script,
  $init_script_template = $::lumberjack::params::init_script_template,
  $log_dir              = $::lumberjack::params::log_dir,
  $logs                 = $::lumberjack::params::logs,
  $pkg_deps             = $::lumberjack::params::pkg_deps,
  $pkg_ensure           = $::lumberjack::params::pkg_ensure,
  $pkg_list             = $::lumberjack::params::pkg_list,
  $port                 = $::lumberjack::params::port,
  $service_enable       = $::lumberjack::params::service_enable,
  $service_ensure       = $::lumberjack::params::service_ensure,
  $service_hasrestart   = $::lumberjack::params::service_hasrestart,
  $service_hasstatus    = $::lumberjack::params::service_hasstatus,
  $service_name         = $::lumberjack::params::service_name,
  $ssl_ca_path          = $::lumberjack::params::ssl_ca_path,
  $window_size          = $::lumberjack::params::window_size,
) inherits lumberjack::params {
  class { 'lumberjack::install': } ->
  class { 'lumberjack::config': } ~>
  class { 'lumberjack::service': } ->
  Class [ 'lumberjack' ]
}

