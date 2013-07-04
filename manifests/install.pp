# == Class lumberjack::install
#
class lumberjack::install {
  package { $::lumberjack::pkg_list:
    ensure => $::lumberjack::pkg_ensure,
  }

  if $::lumberjack::pkg_deps {
    package { $::lumberjack::pkg_deps:
      ensure => $::lumberjack::pkg_ensure,
      before => Package[$::lumberjack::pkg_list],
    }
  }
}

