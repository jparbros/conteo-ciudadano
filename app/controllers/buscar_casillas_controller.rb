class BuscarCasillasController < ApplicationController

  def show
    @estado = State.find_by_name(state_parsed)
    if @estado
      casillas = Box.find_boxes(@estado.id, params[:section])
      @casillas = CasillasPresenter.new(casillas, current_user)
    end
    redirect_to :new unless @estado || @casillas
  end

  def create

    redirect_to buscar_casillas_show_url(params[:estado].downcase, section)
  end

  private

  def section
    @section = params[:section].present? ? params[:section] : 'especiales'
  end

  def state_parsed
    params[:estado].capitalize.gsub('+',' ').gsub('_',' ').gsub('-',' ')
  end
end
