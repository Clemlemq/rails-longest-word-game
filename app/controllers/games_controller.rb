class GamesController < ApplicationController

  require 'open-uri'
  require 'json'

  @letters = Array.new(10) { ('A'..'Z').to_a.sample }

  def new
    @letters
  end

  def score
    @results = ''
    @word = params[:word]
    @letters

    url = "https://wagon-dictionary.herokuapp.com/#{@word}"

    word_serialized = open(url).read
    word_results = JSON.parse(word_serialized)
    @result = Hash.new(0)

      if word_results["found"] == false
          @result[:score] = 0
          @result[:message] = "Sorry but #{@word} can't be built out of #{@letters}"

      elsif @word.upcase.chars.all? { |char| @word.upcase.chars.count(char) <= letters.count(char) } == false
          result[:score] = 0
          result[:message] = "Sorry but #{@word} does not seem to be a valid English Word"

      else
        result[:time] = end_time - start_time
        result[:message] =  "Congratulations ! #{@word} is a valid English Word"
        result[:score] = start_time - end_time + attempt.size
    end
  end
end
