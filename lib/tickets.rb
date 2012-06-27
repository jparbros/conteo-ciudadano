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

  def missing_photo
    tickets.create(issue: 'La casilla no presenta fotografía.')
  end

  def photo_altered
    tickets.create(issue: 'La fotografia parece estar alterada.')
  end

  def dubious_information
    tickets.create(issue: 'La información de la casilla es dudosa.')
  end

  def suspicious_box
    tickets.create(issue: 'La casilla es sospechosa.')
  end

  def overvoting
    tickets.create(issue: 'La casilla presenta una sobrevotación.')
  end

  def box_not_installed
    tickets.create(issue: 'La casilla se reporto como no instalada.')
  end

  def get_map_tickets
    tickets.where(issue: 'Google Maps no funciona.')
  end

end