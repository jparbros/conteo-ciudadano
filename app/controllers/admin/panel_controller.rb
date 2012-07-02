class Admin::PanelController < Admin::BaseController

  def index
    @total = Box.to_verified.count
    @boxes = CasillasPresenter.new Box.to_verified.limit(50)
    @tickets = Ticket.to_attend.limit(10)
    @verified = Box.includes(:result).where('results.state = ?','verified').count
    @rejected = Box.includes(:result).where('results.state = ?','rejected').count
  end

end