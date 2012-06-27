class Admin::VerificationsController < Admin::BaseController

  def index
    @boxes = CasillasPresenter.new Box.to_verified
  end
end
