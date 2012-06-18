class MapTicketsController < ApplicationController

  def create
    box = Box.find(params[:casilla_id])
    message = if box.map_ticket
      {notice: 'Reporte creado exitosamente.'}
    else
      {error: 'Error al crear el reporte.'}
    end
    redirect_to casilla_url(box), flash: message
  end
end
