require "kafinch/version"
require 'cinch'
require 'poseidon'
require 'thor'

module Kafinch
  class App < Thor
    method_option :zookeepers, :aliases => "-z", :desc => "Zookeepers", :default => "localhost:9092"
    method_option :topic, :aliases => "-t", :desc => "Kafka Topic", :default => "irc"
    method_option :channels, :aliases => "-c", :desc => "channels", :required => true
    method_option :server, :aliases => "-s", :required => true
    method_option :nick, :aliases => "-n", :required => true

    desc "exec", "Run!"
    def exec
      producer = Poseidon::Producer.new(options[:zookeepers].split(/,/), options[:topic])

      server = options[:server]
      channels = options[:channels].split(/,/)
      nick = options[:nick]
      bot = Cinch::Bot.new do
        configure do |c|
          c.server = server
          c.channels = channels
          c.nick = nick
        end

        on :message, /\A(.*)\Z/ do |m, mesg|
          key = m.channel.name.gsub(/\A#/,'')
          text = "#{m.user}: #{Cinch::Utilities::String.strip_colors(mesg)}"
          kmsg = Poseidon::MessageToSend.new(key, text)
          producer.send_messages([kmsg])
        end
      end
      bot.start
    end 
  end
end
