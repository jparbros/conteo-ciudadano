class Admin::ResultImagesController < ApplicationController

  def update
    box = Box.find(params[:casilla_id])
    image = ResultImage.find(params[:id])
    old_box = image.box
    image.box_id = box.id
    result = box.result.present? ? box.result : box.create_result
    result.filled! if result.can_filled?
    old_box.result.back!
    if image.save
      redirect_to admin_root_url, flash: {notice: 'La fotografia fue reasiganda.'}
    else
      redirect_to :back, flash: {error: 'Ocurrio un error al reasignar la fotografia.'}
    end
  end
end
