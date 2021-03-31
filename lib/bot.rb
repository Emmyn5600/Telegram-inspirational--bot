require 'telegram/bot'

require_relative 'jokes.rb'
require_relative 'inspiration.rb'

class Bot

    def initialize 
    private
    def request_token
        @token = '1798351052:AAG6Btsz4LpUOXJjOZK8HL2xjmlHSlAJHL4'
    end
    
    Telegram::Bot::Client.run(Bot.new.request_token) do |bot|
        bot.listen do |message|
            case message.text

            when '/start'
                bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} , welcome to Inspirational chat bot created by NSABIMANA Emmanuel, the chat bot is to keep you inspired and entertained. Use  /start to start the bot,  /stop to end the bot, /inspiration to get a different motivational and inspirational quotes everytime you request for it or /joke to get a joke everytime you request for /about to know the creator /map to know the location and /esconnect to know my website I created")
            end
        end
    end
end
end