class Admin::ResultsController < Admin::BaseController
  load_and_authorize_resource

  def show
    @result = casilla.result.present? ? casilla.result : casilla.build_result
  end

  def create
    @result = casilla.build_result(params[:result])
    if @result.save
      @result.approved! if @result.can_approved?
      redirect_to admin_root_url, flash: {notice: 'La casilla fue verificada.'}
    else
      render :show, flash: {error: 'Ocurrio un error al verificar las casilla.'}
    end
  end

  def update
    if casilla.result.update_attributes(params[:result])
      casilla.result.approved! if casilla.result.can_approved?
      redirect_to admin_root_url, flash: {notice: 'La casilla fue verificada.'}
    else
      render :show, flash: {error: 'Ocurrio un error al verificar las casilla.'}
    end
  end

  private

  def casilla
    @casilla ||= CasillaPresenter.new Box.find(params[:box_id])
  end
end
