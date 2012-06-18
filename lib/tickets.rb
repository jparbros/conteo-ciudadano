# encoding: UTF-8
module Tickets
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods

    def act_as_ticketable
      has_many :tickets, :as => :ticketable, :dependent => :destroy
    end

  end

  def map_ticket
    tickets.create(issue: 'Google Maps no funciona.')
  end

  def get_map_tickets
    tickets.where(issue: 'Google Maps no funciona.')
  end

end