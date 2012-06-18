class BuscarCasillasController < ApplicationController

  def show
    @estado = State.find_by_name params[:estado].capitalize
    casillas = Box.by_state_and_section(@estado.id, params[:section])
    @casillas = CasillasPresenter.new(casillas, current_user)
    redirect_to :new unless @estado || @casillas
  end

  def create
    redirect_to buscar_casillas_show_url(params[:estado].downcase, params[:section])
  end
end
