# Class activemq::install
class activemq::install {

  group { $activemq::group:
    ensure => present,
    system => true,
    before => User[$activemq::user],
  }

  user { $activemq::user:
    ensure     => present,
    home       => $activemq::home,
    managehome => false,
    system     => true,
    before     => Archive["/opt/apache-activemq-${activemq::version}-bin.tar.gz"],
  }

  archive { "/opt/apache-activemq-${activemq::version}-bin.tar.gz":
    ensure        => present,
    extract       => true,
    extract_path  => '/opt',
    source        => "https://archive.apache.org/dist/activemq/${activemq::version}/apache-activemq-${activemq::version}-bin.tar.gz",
    checksum      => $activemq::checksum,
    checksum_type => $activemq::checksum_type,
    creates       => "/opt/apache-activemq-${activemq::version}",
    cleanup       => true,
  }

  file { "/opt/apache-activemq-${activemq::version}":
    ensure  => directory,
    owner   => $activemq::user,
    group   => $activemq::group,
    recurse => true,
  }

  file { $activemq::home:
    ensure => link,
    target => "/opt/apache-activemq-${activemq::version}",
  }

  file { $activemq::config_path:
    ensure => link,
    target => "${activemq::home}/conf",
  }

  file { '/var/log/activemq':
    ensure => link,
    target => "${activemq::home}/data",
  }

  file { "${activemq::system_config_path}/activemq":
    ensure  => file,
    owner   => $activemq::user,
    group   => $activemq::group,
    content => epp('activemq/activemq.sysconfig.epp',{
      memory  => $activemq::memory,
    }),
    notify  => Service['activemq'],
  }

  include ::systemd::systemctl::daemon_reload

  file { '/usr/lib/systemd/system/activemq.service':
    ensure  => file,
    owner   => $activemq::user,
    group   => $activemq::group,
    content => epp('activemq/activemq.service.epp',{
      user  => $activemq::user,
      group => $activemq::group,
      spath => $activemq::system_config_path,
      home  => $activemq::home,
    }),
    notify  => [
      Class['systemd::systemctl::daemon_reload'],
      Service['activemq'],
    ],
  }

  service { 'activemq':
    ensure  => running,
    enable  => true,
    require => File['/usr/lib/systemd/system/activemq.service'],
  }

}
