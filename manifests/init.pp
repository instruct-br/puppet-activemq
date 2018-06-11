# Class activemq

class activemq (
  $version            = '5.15.2',
  $checksum           = 'ed2da381eeea5d0d43601f4e97d91bb8',
  $checksum_type      = 'md5',
  $memory             = '-Xms512m -Xmx512m',
  $home               = '/opt/activemq',
  $user               = 'activemq',
  $group              = 'activemq',
  $mco_config         = true,
  $mco_user           = 'mcollective',
  $mco_pass           = 'p4ssw0rd',
  $system_config_path = '/etc/sysconfig',
  ) {

  include activemq::install

  if $mco_config {
    include activemq::mco
  }

}