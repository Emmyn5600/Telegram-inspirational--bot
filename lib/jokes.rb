require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot'

class Joke
  def initialize; end

  def learn_new_thing
    url = 'https://api.yomomma.info'

    encoded_address = CGI.escape(url)
    uri = CGI.parse(encoded_address)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
