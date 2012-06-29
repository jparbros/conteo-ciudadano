class CasillasController < ApplicationController

  def show
    @casilla = CasillaPresenter.new(Box.find(params[:id]), current_user)
    @casilla.build_result unless @casilla.result
  end

  def update
    @casilla = Box.find params[:id]
    if params[:result_image].present?
      result_image = @casilla.result_images.build
      result_image.image = params[:result_image]
      result_image.save!
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def box_params
    params[:box].slice(Box::NO_EDITABLE_FIELDS)
  end
end
