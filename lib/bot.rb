require 'telegram/bot'
require_relative 'inspire.rb'
require_relative 'joke.rb'

class Bot
  def initialize
    token = '1478214366:AAESsJ-ne12dZG3HY4CO5haNipo5N5r5ZTA'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start' 
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, 
            welcome to inspirational chat bot created by Eric Enaburekhan, the chat bot is to keep you 
            inspired and entertained. Use  /start to start the bot,  /stop to end the bot, /inspire 
            to get a diffrent inspirational quote everytime you request for it or /joke to get a joke 
            everytime you request for it")
  
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}", date: message.date)  
          
        when '/inspire'
            values = Inspire.new
            value = values.select_random
            bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)
    
          when '/joke'
            values = Joke.new
            value = values.make_the_request
    
            bot.api.send_message(chat_id: message.chat.id, text: "#{value['joke']}", date: message.date)
    
          else
    
            bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop , /motivate or /joke")
        end      
     end      
   end      
 end
end