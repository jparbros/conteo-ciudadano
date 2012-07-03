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


  def create_twitter(issue)
    tickets.create(issue: issue)
    self.result.try(:rejecting!) if self.result.try(:can_rejecting?)
  end

  def map_ticket
    create_twitter('Google Maps no funciona.')
  end

  def missing_photo
   create_twitter('La casilla no presenta fotografía.')
  end

  def photo_altered
    create_twitter('La fotografia parece estar alterada.')
  end

  def dubious_information
    create_twitter('La información de la casilla es dudosa.')
  end

  def suspicious_box
    create_twitter('La casilla es sospechosa.')
  end

  def overvoting
    create_twitter('La casilla presenta una sobrevotación.')
  end

  def box_not_installed
    create_twitter('La casilla se reporto como no instalada.')
  end

  def photo_illegible
    create_twitter('La fotografía es ilegible.')
  end

  def get_map_tickets
    tickets.where(issue: 'Google Maps no funciona.')
  end

  def get_tickets
    tickets.where('tickets.issue != ?', 'Google Maps no funciona.')
  end
end