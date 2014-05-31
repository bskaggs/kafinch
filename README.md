# Kafinch

Kafinch sits in one or more chatrooms on an IRC server and relays messages to Apache Kafka.

## Installation

    $ gem install kafinch

## Usage

    Usage:
      kafinch exec -c, --channels=CHANNELS -n, --nick=NICK -s, --server=SERVER
    
    Options:
      -z, [--zookeepers=ZOOKEEPERS]  # Zookeepers
                                     # Default: localhost:9092
      -t, [--topic=TOPIC]            # Kafka Topic
                                     # Default: irc
      -c, --channels=CHANNELS        # channels
      -s, --server=SERVER            
      -n, --nick=NICK  

## Contributing

1. Fork it ( https://github.com/bskaggs/kafinch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
