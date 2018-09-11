# Class activemq

class activemq (
  $version             = '5.15.6',
  $checksum            = 'e79acb9dba66ba7b80e3148ce60f5c72',
  $checksum_type       = 'md5',
  $memory              = '-Xms512m -Xmx512m',
  $home                = '/opt/activemq',
  $user                = 'activemq',
  $group               = 'activemq',
  $mco_config          = true,
  $mco_user            = 'mcollective',
  $mco_pass            = 'p4ssw0rd',
  $system_config_path  = '/etc/sysconfig',
  $truststore_password = 'p4ssw0rd',
  $keystore_password   = 'p4ssw0rd',
  ) {

  include activemq::install

  if $mco_config {
    include activemq::mco
  }

}