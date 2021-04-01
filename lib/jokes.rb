require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot'

class Joke
  new_values = nil

  def initialize
    new_values = @learn_new_thing
  end

  def learn_new_thing
    url = 'https://api.yomomma.info'

    encoded_address = URI.escape(url)
    uri = URI.parse(encoded_address)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end
