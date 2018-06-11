# Class activemq::mco

class activemq::mco {

  file { '/etc/activemq/ssl':
    ensure => directory,
    mode   => '0644',
    owner  => $activemq::user,
    group  => $activemq::group,
  }

  java_ks { 'puppet_ca_truststore':
    ensure       => latest,
    certificate  => '/etc/puppetlabs/puppet/ssl/certs/ca.pem',
    target       => '/etc/activemq/ssl/truststore.ts',
    password     => $activemq::truststore_password,
    trustcacerts => true,
  }

  java_ks { 'puppet_agent_keystore':
    ensure      => latest,
    certificate => "/etc/puppetlabs/puppet/ssl/certs/${::trusted['certname']}.pem",
    private_key => "/etc/puppetlabs/puppet/ssl/private_keys/${::trusted['certname']}.pem",
    target      => '/etc/activemq/ssl/keystore.ks',
    password    => $activemq::keystore_password,
  }

  file { '/etc/activemq/activemq.xml':
    ensure  => file,
    owner   => $activemq::user,
    group   => $activemq::group,
    content => epp('activemq/activemq.xml.epp',{
      mco_user            => $activemq::mco_user,
      mco_pass            => $activemq::mco_pass,
      keystore_password   => $activemq::keystore_password,
      truststore_password => $activemq::truststore_password,
    }),
    notify  => Service['activemq'],
  }

}