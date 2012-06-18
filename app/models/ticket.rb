class Ticket < ActiveRecord::Base
  attr_accessible :issue, :state, :ticketable_id, :ticketable_type

  state_machine :state, :initial => :new do
    state :assigned
    state :closed
  end
end
