class CasillasController < ApplicationController

  def show
    @casilla = CasillaPresenter.new(Box.find(params[:id]), current_user)
    @casilla.build_result unless @casilla.result
    @casilla.result_images.build if @casilla.result_images.blank?
  end

  def update
    @casilla = Box.find params[:id]
    if @casilla.update_attributes(box_params)
      puts box_params
      redirect_to casilla_url(@casilla)
    else
      @casilla.build_result unless @casilla.result
      @casilla.result_images.build if @casilla.result_images.blank?
      render :action => :show
    end
  end

  private
  def box_params
    Box::NO_EDITABLE_FIELDS.each do |no_editable_field|
      params[:box].delete(no_editable_field)
    end
    params[:box].delete(:result_attributes) unless current_user && @casilla.has_results?
    params[:box]
  end
end
