class FaltantesController < ApplicationController

  def index
    @states = State.all
  end

  def show
    casillas = Box.missing_image_by_state(state_parsed).order('boxes.id asc').page(params[:page]).per(25)
    @casillas = CasillasPresenter.new(casillas, current_user)
  end

  private

  def state_parsed
    @estado ||= params[:estado].capitalize.gsub('+',' ').gsub('_',' ').gsub('-',' ')
  end
end
