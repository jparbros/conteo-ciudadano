class CasillaPresenter < SimpleDelegator
  def initialize(casilla = Box.new, current_user = nil)
    @current_user = current_user
    super(casilla)
  end

  def complete_address
    "#{self.location}; #{self.address} #{self.references}"
  end

  def kind_and_number
    "#{self.kind} #{self.number}"
  end

  def editable?
    !self.has_results? and @current_user
  end

  def results_partial
    editable? ? 'results_form' : 'results'
  end

  def map_reported?
    !get_map_tickets.blank?
  end
end