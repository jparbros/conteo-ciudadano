class CasillaPresenter < SimpleDelegator

  def self.human_attribute_name(attribute_key_name, options = {})
    Box.human_attribute_name attribute_key_name, options
  end

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
    @current_user && self.has_results?
  end

  def results_partial
    editable? ? 'results_form' : 'results'
  end

  def map_reported?
    !get_map_tickets.blank?
  end

  def verified!
    if can_verified?
      verified_result
      verifications.create(user_id: @current_user.id, checker_ip: User.remote_ip)
    end
  end

  def can_verified?
    return true if verifications.blank?
    verifications.each do |verification|
      return false if verification.checker_ip == User.remote_ip || verification.user_id == @current_user.id
    end
    return true
  end

  def verified_result
    if result.can_pre_approved?
      result.pre_approved!
    else
      result.approved! if result.can_approved?
    end
  end

end