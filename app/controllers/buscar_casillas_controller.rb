class BuscarCasillasController < ApplicationController

  def show
    @estado = State.find params[:estado]
    @casillas = Box.by_state_and_section params[:estado], params[:section]
  end
end
