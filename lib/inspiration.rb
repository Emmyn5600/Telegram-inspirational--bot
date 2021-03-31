require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'


class Inspiration

    @new_joke = nil

    def initialize
        @new_joke = @make_the_request
    end

    def make_the_request
        url = 'https://type.fit/api/quotes'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        response
      end
    
      def select_random
        @new_joke = @new_joke.sample
        @new_joke
      end 

end