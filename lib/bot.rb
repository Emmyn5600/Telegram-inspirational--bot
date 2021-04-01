require 'telegram/bot'

require_relative 'jokes'
require_relative 'inspiration'

class Bot

  puts 'Inspirational Telegram bot developed by NSABIMANA Emmanuel'
  puts '----------------------------------------------'
  sleep 1
  puts 'Hello! , Welcome to Inspirational telegram bot'
  sleep 1
  puts '----------------------------------------------'
  puts 'This is a bot to help you stay Inspired, motivated by giving you inspirational and motivation quotes'

  puts 'The bot can also keep you smiling by providing you fun jokes'

  puts 'This bot will help you when you feeling down and demotivated'
  sleep 1

  puts '----------------------------------------------'
  puts '...loading the bot is now online... use ctrl-c to stop the bot and ctrl-l to clear the terminal'

  token = '1777054662:AAH48evzw_AnfvQ8x9d9jk7XvhsXjGYyCu4'

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
                             text: "Hi!, My name is NSABIMANA Emmanuel creator of @emmyn5600bot. \n I am a Rwandan by nationality. \n I created this bot as part of a Microverse capstone project to show case \n my skills as a developer of the Ruby language. \n To get more help for this use the command '/help' to see more.")

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
