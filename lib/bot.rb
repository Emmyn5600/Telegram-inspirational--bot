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

                    when '/esconnect'
                      bot.api.send_message(chat_id: message.chat.id, text: "Hello #{message.from.first_name}, "Welcome to my own website http://esconnectus.com/"")

                    when '/stop'
                      bot.api.send_message(chat_id: message.chat.id, text: "Good Bye, #{message.from.first_name}", date: message.date)

                    when '/about'
                      bot.api.send_message(chat_id: message.chat.id, text: "Hi!, My name is NSABIMANA Emmanuel creator of @emmyn5600bot. I am a Rwandan by nationality. I created this bot as part of a Microverse capstone project to show case my skills as a developer of the Ruby language. To get more help for this use the command '/help' to see more.")

                    when '/map'
                        bot.api.send_location(chat_id: message.chat.id, latitude: -37.807416, longitude: 144.985339)

                    when '/inspiration'
                        values = Inspiration.new
                        value = values.select_random
                        bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)

                    when '/joke'
                        values = Joke.new
                        value = values.make_the_request
                        bot.api.send_message(chat_id: message.chat.id, text: "#{value['joke']}", date: message.date)
                        
        
                           
            end
        end
    end
end
end