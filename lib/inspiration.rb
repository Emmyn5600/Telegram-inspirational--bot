require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'


class Inspiration

    @new_inspiration = nil

    def initialize
        @new_inspiration = @make_the_request
    end

    def make_the_request
        url = 'https://type.fit/api/quotes'
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response = JSON.parse(response)
        response
      end
    
      def select_random
        @new_inspiration = @new_inspiration.sample
        @new_inspiration
      end 

end