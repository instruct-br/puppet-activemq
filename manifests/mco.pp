# Class activemq::mco

class activemq::mco {

  file { '/etc/activemq/activemq.xml':
    ensure  => file,
    owner   => $activemq::user,
    group   => $activemq::group,
    content => epp('activemq/activemq.xml.epp',{
      mco_user => $activemq::mco_user,
      mco_pass => $activemq::mco_pass,
    }),
    notify  => Service['activemq'],
  }

}
