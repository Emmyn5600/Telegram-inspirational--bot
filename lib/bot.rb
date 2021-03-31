require 'telegram/bot'

require_relative 'jokes.rb'
require_relative 'inspiration.rb'

class Bot

    private
    def token
        @token = '1798351052:AAG6Btsz4LpUOXJjOZK8HL2xjmlHSlAJHL4'
    end
    
    Telegram::Bot::Client.run(Bot.new.token) do |bot|
        bot.listen do |message|
            case message.text
            end
        end
    end

end