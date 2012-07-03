class VerificacionController < ApplicationController
  def show
    @casilla = CasillaPresenter.new(Box.to_verified.offset(rand(Box.to_verified.count)).first, current_user)
  end
end
