class TicketsController < ApplicationController

  def create
    box = Box.find(params[:casilla_id])
    message = if box.send(params[:reason])
      box.result.reporting! if box.result.can_reporting?
      {notice: 'Reporte creado exitosamente.'}
    else
      {error: 'Error al crear el reporte.'}
    end
    redirect_to casilla_url(box), flash: message
  end
end
