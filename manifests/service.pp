# == Class lumberjack::service
#
class lumberjack::service {
  service { $::lumberjack::service_name:
    ensure     => $::lumberjack::service_ensure,
    enable     => $::lumberjack::service_enable,
    hasrestart => $::lumberjack::service_hasrestart,
    hasstatus  => $::lumberjack::service_hasstatus,
    require    => Class['::lumberjack::config'];
  }
}

