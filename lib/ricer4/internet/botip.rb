module Ricer4::Plugins::Internet
  class Botip < Ricer4::Plugin

    trigger_is "net.botip"

    has_usage
    def execute
      require "open-uri"
      threaded do
        ip = open("http://ipecho.net/plain")
        response = ip.read
        reply response
      end
    end
  end
end
