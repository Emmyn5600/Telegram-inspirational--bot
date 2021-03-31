require 'telegram/bot'

require_relative 'jokes'
require_relative 'inspiration'

class Bot
  def initialize
    token = '1798351052:AAG6Btsz4LpUOXJjOZK8HL2xjmlHSlAJHL4'

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text

        when '/start'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello, #{message.from.first_name} , welcome to Inspirational chat bot created by NSABIMANA Emmanuel,
                                the chat bot is to keep you inspired and entertained.
                                 Use  /start to start the bot,  /stop to end the bot,
                                /inspiration to get a different motivational and inspirational quotes everytime you request for it or
                                /joke to get a joke everytime you request for /about to know the creator /map to know the location and
                                 /esconnect to know my website I created /help to get more clarification /sleep if it is in mid-night ")

        when '/esconnect'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello #{message.from.first_name}, Welcome to http://esconnectus.com/")

        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Good Bye, #{message.from.first_name}",
                               date: message.date)

        when '/about'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hi!, My name is NSABIMANA Emmanuel creator of @emmyn5600bot.
                               I am a Rwandan by nationality.
                               I created this bot as part of a Microverse capstone project to show case my skills as a developer of the Ruby language.
                               To get more help for this use the command '/help' to see more.")

        when '/map'
          bot.api.send_location(chat_id: message.chat.id, latitude: -37.807416, longitude: 144.985339)

        when '/inspiration'
          new_values = Inspiration.new
          value = new_values.random_quote
          bot.api.send_message(chat_id: message.chat.id, text: (value['text']).to_s, date: message.date)

        when '/joke'
          new_values = Joke.new
          value = new_values.learn_new_thing
          bot.api.send_message(chat_id: message.chat.id, text: (value['joke']).to_s, date: message.date)

        when '/sleep'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Sorry It's too late #{message.from.first_name} has slept already!!! try tomorrow")

        when '/help'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "You get stuck😭 You are asking yourself what to do!!😭 .
                               Just type the following command  '/joke' to see awesome jokes,
                                '/inspiration' to get  an inspirational quote, '/about'
                                 to see more about the creator and '/stop'
                                 to stop me🙁 '/map' to get a locatin
                                '/esconnect' to see my website.")

        else
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Invalid entry, #{message.from.first_name}, you need to use  /start, /esconnect, /stop, /about, /map,
                               /inspiration /sleep or /joke")
        end
      end
    end
  end
end
