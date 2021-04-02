# rubocop: disable Metrics/CyclomaticComplexity

require 'telegram/bot'

require_relative 'jokes'
require_relative 'inspiration'

require 'dotenv'
Dotenv.load('token.env')

class Bot
  def initialize
    token = ENV['TOKEN']

    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text

        when '/start'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello, #{message.from.first_name}, \n welcome to Inspirational chat bot created by \n NSABIMANA Emmanuel, \n the chat bot is to keep you inspired and entertained.\n Use \n /start to start the bot, \n /stop to end the bot, \n /inspiration to get a different inspirational quotes everytime you request for it or\n /joke to get a joke everytime you request for \n /about to know the creator \n /map to know the location and \n /esconnect to know my website I created \n /help to get more clarification \n /sleep if it is in mid-night ")

        when '/esconnect'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hello #{message.from.first_name}, Welcome to http://esconnectus.com/")

        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Good Bye, #{message.from.first_name}",
                               date: message.date)

        when '/about'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hi!, My name is NSABIMANA Emmanuel creator of @emmy5600Bot. \n I am a Rwandan by nationality. \n I created this bot as part of a Microverse capstone project to show case \n my skills as a developer of the Ruby language. \n To get more help for this use the command '/help' to see more.")

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
                               text: "You get stuck😭 You are asking yourself what to do!!😭.\n Just type the following command\n '/start' to see awesome jokes,\n '/inspiration' to get  an inspirational quote,\n '/about' to see more about the creator \n '/stop' to stop me🙁 \n '/map' to get a location \n '/sleep' to remind it is a night \n '/joke' to start the bot \n '/esconnect' to see my website.")

        else
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Invalid entry, #{message.from.first_name},you need to use \n /start, \n /esconnect, \n /stop, \n /about, \n /map, \n /inspiration \n /sleep or /joke")
        end
      end
    end
  end
end

# rubocop: enable Metrics/CyclomaticComplexity
