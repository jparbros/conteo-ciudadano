class Api::CasillasController < ApplicationController
  respond_to :json, :xml

  def index
    @casillas = Box.search(params).page(params[:page] || 1).per(per_params)
    respond_with @casillas
  end

  def show
    @casilla = Box.find params[:id]
    respond_with @casilla
  end

  def per_params
    (params[:per].present? && params[:per].to_i <= 100) ? params[:per] : 10
  end
end
