class Admin::PanelController < Admin::BaseController

  def index
    @total = Box.to_verified.count
    @boxes = CasillasPresenter.new Box.to_verified.limit(50)
    @tickets = Ticket.to_attend.limit(10)
  end

end