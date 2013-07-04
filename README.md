# Puppet Lumberjack

## Build status

[![Build Status](https://travis-ci.org/arioch/puppet-lumberjack.png?branch=master)](https://travis-ci.org/arioch/puppet-lumberjack)


## Example usage

### Install lumberjack

    node /box/ {
      include lumberjack
    }

### Configure lumberjack

    node /box/ {
      class { 'lumberjack':
        host        => '127.0.0.1',
        port        => 5000,
        window_size => 1024,
        logs        => [ '/var/log/*', '/var/log/*/*' ],
      }
    }


## Contributing

* Fork it
* Create a feature branch (`git checkout -b my-new-feature`)
* Run rspec tests (`bundle exec rake spec`)
* Commit your changes (`git commit -am 'Added some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request

