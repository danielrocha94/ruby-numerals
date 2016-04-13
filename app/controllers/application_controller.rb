require "numerals/numerals"

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def create
    number = params[:input].to_i
    numeral = Numerals.new
    result = numeral.number_words()
  end
end
