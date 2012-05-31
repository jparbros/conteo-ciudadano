class CasillasController < ApplicationController

  def show
    @casilla = Box.find params[:id]
  end
end
