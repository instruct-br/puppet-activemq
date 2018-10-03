# Class activemq
#
# This is a class to install and manage ActiveMQ:
#
# @example Declaring the class
#   include activemq
#
# @param [String] version ActiveMQ release version
# @param [String] checksum Archive file checksum
# @param [String] checksum_type Archive file checksum type
# @param [String] memory ActiveMQ memory usage options
# @param [String] home ActiveMQ home directory
# @param [String] user ActiveMQ system user
# @param [String] group ActiveMQ system group
# @param [Boolean] mco_config Enable to manage MCollective configuration. Default: true
# @param [String] mco_user ActiveMQ simple authentication username
# @param [String] mco_pass ActiveMQ simple authentication password
# @param [String] system_config_path ActiveMQ configuration path
# @param [String] truststore_password Password to unlock the keystore file
# @param [String] keystore_password Password to unlock the keystore file and for the private key stored in the keystore
#
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