class CasillasController < ApplicationController

  def show
    @casilla = Box.find params[:id]
  end

  def update
    @casilla = Box.find params[:id]
    if params[:qqfile].present?
      result_image = @casilla.result_images.build
      result_image.image = params[:qqfile]
      result_image.save!
      puts result_image.image.url
      debugger
      render json: result_image.to_json
    else

    end
  end
end
