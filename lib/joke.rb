
require 'net/http'
require 'json'
require_relative 'bot.rb'

# joke class
class Joke
  attr_reader :values

  def initialize
    @values = @make_the_request
  end

  def make_the_request
    url = 'https://api.yomomma.info'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response = JSON.parse(response)
    response
  end
end


