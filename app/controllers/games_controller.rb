require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = []
    range = ("A".."Z").to_a
    10.times do
      @letters << range.sample
    end
  end

  def score
    @word1 = params[:word].downcase
    @word2 = params[:letters].downcase
    @check1 = @word1.chars.all? { |letter| @word2.include?(letter) }

    url = "https://wagon-dictionary.herokuapp.com/#{@word1}"
    url_result = URI.open(url).read
    @check2 = JSON.parse(url_result)
  end
end
