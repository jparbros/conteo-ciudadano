class Admin::PanelController < Admin::BaseController

  def index
    @boxes = CasillasPresenter.new Box.to_verified.limit(10)
    @tickets = Ticket.to_attend.limit(10)
  end

end