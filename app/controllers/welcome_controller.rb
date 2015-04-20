class WelcomeController < ApplicationController
  after_action :allow_iframe, only: :iframe

  def index
    if session[:test].nil?
      session[:test] = 0
    end
    session[:test] += 1
    @test = session[:test]
  end

  def iframe

    if session[:test].nil?
      @test = 'セッションが取れません！'
      return
    end
    @test = session[:test]
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end