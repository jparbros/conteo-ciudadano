class CasillasController < ApplicationController

  def show
    @casilla = Box.find params[:id]
  end

  def update
    @casilla = Box.find params[:id]
    if params[:result_image].present?
      result_image = @casilla.result_images.build
      result_image.image = params[:result_image]
      result_image.save!
      render json: result_image.to_json
    else
      render json: {some: :some}
    end
  end
end
