class Admin::TicketsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @tickets = Ticket.page(params[:page])
  end

  def create
    box = Box.find(params[:box_id])

    message = if box.send(params[:reason])
      {notice: 'Reporte creado exitosamente.'}
    else
      {error: 'Error al crear el reporte.'}
    end
    redirect_to :back, flash: message
  end

  def update
    @ticket = Ticket.find(params[:id])

    message = if @ticket.send(params[:next_state])
                { :notice => 'El ticket fue actualizado correctamente.' }
              else
                { :error => 'Ocurrio un error al actualizar el ticket.' }
              end

    redirect_to admin_tickets_url, flash: message
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    redirect_to admin_tickets_url
  end

end