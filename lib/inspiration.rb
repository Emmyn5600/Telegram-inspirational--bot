require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot'

class Inspiration
  @new_quote = nil

  def initialize
    @new_quote = learn_new_thing
  end

  def learn_new_thing
    url = 'https://type.fit/api/quotes'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def random_quote
    @new_quote = @new_quote.sample
    @new_quote
  end
end
