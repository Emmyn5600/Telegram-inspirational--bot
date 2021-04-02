require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot'

class Joke
  def initialize; end

  def learn_new_thing
    url = 'https://api.yomomma.info'

    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
