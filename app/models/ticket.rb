class Ticket < ActiveRecord::Base
  #
  # Attributes Accesors
  #
  attr_accessible :issue, :state, :ticketable_id, :ticketable_type

  #
  # Asociations
  #
  belongs_to :ticketable, :polymorphic => true

  #
  # State Machine
  #
  state_machine :state, :initial => :new do
    state :assigned
    state :closed

    event :assign do
      transition new: :assigned
    end

    event :close do
      transition assigned: :closed
    end
  end

  def self.open_tickets
    where('state != ?','closed')
  end

  def self.to_attend
    where(state: 'new')
  end

  def next_state
    case state
    when 'new'
      'assign'
    when 'assigned'
      'close'
    else
      nil
    end
  end

end