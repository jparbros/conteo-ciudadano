class HomeController < ApplicationController

  def index
    @exit_poll = ExitPoll.new
  end

  def api
  end

  def encuesta

  end

end