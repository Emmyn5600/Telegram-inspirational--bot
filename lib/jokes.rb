require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Joke
      @new_joke = nil

      def initialize
        @new_joke = @make_the_request
      end

      def make_the_request
            url = 'https://api.yomomma.info'
            encoded_address = URI.escape(url)
            uri = URI.parse(encoded_address)
            response = Net::HTTP.get(uri)
            response = JSON.parse(response)
            response
      end
end