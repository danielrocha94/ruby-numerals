class StaticPagesController < ApplicationController
  def create
  end

  def home
    @number = params[:input].to_i
    result = Numerals.new
    @output = result.number_words(@number)
  end

  def help
  end
end
