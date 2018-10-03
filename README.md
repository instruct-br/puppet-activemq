[![Build Status](https://travis-ci.org/instruct-br/puppet-activemq.svg?branch=master)](https://travis-ci.org/instruct-br/puppet-activemq) ![License](https://img.shields.io/badge/license-Apache%202-blue.svg) ![Version](https://img.shields.io/puppetforge/v/instruct/activemq.svg) ![Downloads](https://img.shields.io/puppetforge/dt/instruct/activemq.svg)

# ActiveMQ

#### Table of contents

1. [Overview](#overview)
3. [Supported Platforms](#supported-platforms)
4. [Requirements](#requirements)
5. [Installation](#installation)
6. [Usage](#usage)
7. [References](#references)
8. [Development](#development)

## Overview

This module will install and manage Apache ActiveMQ in your system.

## Supported Platforms

This module was tested under these platforms

- RedHat 7
- CentOS 7
- Scientific 7
- Oracle 7

Tested only in x86_64 arch.

## Requirements

- Puppet >= 5.x
  - Hiera >= 3.4
  - Facter >= 2.5

## Installation

via git

    # cd /etc/puppetlabs/code/environment/production/modules
    # git clone https://github.com/instruct-br/puppet-activemq.git activemq

via puppet

    # puppet module install instruct/activemq

via puppetfile

    mod 'instruct-activemq'

## Usage

### Quick run

    puppet apply -e "include activemq"

### Using with parameters

#### Example in EL 7

```
class { 'activemq':
  version             => '5.15.6',
  checksum            => 'e79acb9dba66ba7b80e3148ce60f5c72',
  checksum_type       => 'md5',
  memory              => '-Xms512m -Xmx512m',
  home                => '/opt/activemq',
  user                => 'activemq',
  group               => 'activemq',
  mco_config          => true,
  mco_user            => 'mcollective',
  mco_pass            => 'p4ssw0rd',
  system_config_path  => '/etc/sysconfig',
  truststore_password => 'p4ssw0rd',
  keystore_password   => 'p4ssw0rd',
}
```

## References

### Classes

```
activemq
activemq::install (private)
activemq::mco (private)
```

### Parameters type

#### `version`

Type: String

ActiveMQ release version. Defaults to `5.15.6`.

#### `checksum`

Type: String

Archive file checksum (match checksum_type). Defaults to `e79acb9dba66ba7b80e3148ce60f5c72`.

#### `checksum_type`

Type: String

Archive file checksum type (none|md5|sha1|sha2|sha256|sha384|sha512). Defaults to `md5`.

#### `memory`

Type: String

ActiveMQ memory usage options. Defaults to `-Xms512m -Xmx512m`.

#### `home`

Type: String

ActiveMQ home directory. Defaults to `/opt/activemq`.

#### `user`

Type: String

ActiveMQ system user. Defaults to `activemq`.

#### `group`

Type: String

ActiveMQ system group. Defaults to `activemq`.

#### `mco_config`

Type: Boolean

Enable to manage MCollective configuration.. Defaults to `true`.

#### `mco_user`

Type: String

ActiveMQ simple authentication username. Defaults to `mcollective`.

#### `mco_pass`

Type: String

ActiveMQ simple authentication password. Defaults to `p4ssw0rd`.

#### `system_config_path`

Type: String

ActiveMQ configuration path. Defaults to `/etc/sysconfig`.

#### `truststore_password`

Type: String

Password to unlock the keystore file. Defaults to `p4ssw0rd`.

#### `keystore_password`

Type: String

Password to unlock the keystore file and for the private key stored in the keystore. Defaults to `p4ssw0rd`.

## Development

### My dev environment

This module was developed using

- Puppet 5.5.6
  - Hiera 3.4.3 (v5 format)
  - Facter 3.11.1
- CentOS 7.4
- VirtualBox 5.2.18
- Vagrant 2.1.1

### Testing

This module uses puppet-lint, puppet-syntax, metadata-json-lint, rspec-puppet and travis-ci. We hope you use them before submitting your PR.

#### Installing gems

    gem install bundler --no-rdoc --no-ri
    bundle install --without development

#### Running syntax tests

    bundle exec rake syntax
    bundle exec rake lint
    bundle exec rake metadata_lint

#### Running unit tests

    bundle exec rake spec

### Author

Guto Carvalho (gutocarvalho at instruct dot com dot br)

### Contributors

Taciano Tres (taciano at instruct dot com dot br)
