class WelcomeController < ApplicationController
  def index
    if session[:test].nil?
      session[:test] = 0
    end
    session[:test] += 1
    @test = session[:test]
  end
end