# == Class lumberjack::params
#
class lumberjack::params {
  $host        = '172.0.0.1'
  $logs        = [ '/var/log/*', '/var/log/*/*' ]
  $port        = 5000
  $ssl_ca_path = '/etc/ssl/logstash.pub'
  $window_size = 1024

  case $::operatingsystem {
    'RedHat': {
      $config_dir         = '/etc/lumberjack'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_file        = '/etc/default/lumberjack'
      $config_group       = 'root'
      $config_file_mode   = '0644'
      $config_user        = 'root'
      $log_dir            = '/var/log/lumberjack'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = 'lumberjack'
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = true
      $service_hasstatus  = true
      $service_name       = 'lumberjack'

      $init_script          = '/etc/init.d/lumberjack'
      $init_script_template = $::lsbmajdistrelease ? {
        default => template('lumberjack/init-script-rhel.sh'),
      }
    }

    'Debian': {
      $config_dir         = '/etc/lumberjack'
      $config_dir_mode    = '0755'
      $config_dir_recurse = false
      $config_file        = '/etc/default/lumberjack'
      $config_file_mode   = '0644'
      $config_group       = 'root'
      $config_user        = 'root'
      $log_dir            = '/var/log/lumberjack'
      $pkg_deps           = undef
      $pkg_ensure         = present
      $pkg_list           = 'lumberjack'
      $service_enable     = true
      $service_ensure     = running
      $service_hasrestart = true
      $service_hasstatus  = true
      $service_name       = 'lumberjack'

      $init_script          = '/etc/init.d/lumberjack'
      $init_script_template = $::lsbmajdistrelease ? {
        /wheezy/ => template('lumberjack/upstart-script-debian.sh'),
        default  => template('lumberjack/init-script-debian.sh'),
      }
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

