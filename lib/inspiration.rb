require 'telegram/bot'
require 'net/http'
require 'json'
require_relative 'bot.rb'

class Inspiration
    
  @new_quote = nil

  def initialize
    @new_quote = make_the_request
  end

  def make_the_request
    url = 'https://type.fit/api/quotes'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end

  def random_quote
    @new_quote = @new_quote.sample
    @new_quote
  end

end