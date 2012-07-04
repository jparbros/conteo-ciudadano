class VerificacionController < ApplicationController
  def show
    @casilla = CasillaPresenter.new(Box.to_verified.offset(rand(Box.to_verified.count)).first, current_user)
  end

  def update
    box = CasillaPresenter.new Box.find(params[:id]), current_user
    box.verified!
    redirect_to action: :show
  end
end
