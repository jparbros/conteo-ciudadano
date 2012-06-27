class Admin::VerificationsController < Admin::BaseController
  load_and_authorize_resource :verification

  def index
    @boxes = CasillasPresenter.new Box.to_verified
  end
end
