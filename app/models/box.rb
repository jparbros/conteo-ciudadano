# encoding: UTF-8
class Box < ActiveRecord::Base

  include GoogleMaps
  include Tickets

  act_as_ticketable

  #
  # Attributtes accesors
  #
  attr_accessible :state_id, :number, :location, :address, :references, :section, :district, :active, :district_head, :nominal_list, :kind

  #
  # Relations
  #
  belongs_to :state
  has_one :result
  accepts_nested_attributes_for :result
  has_many :result_images
  #
  # Delegates
  #
  delegate :name, to: :state, prefix: true

  def self.by_state_and_section state_id, section
    where state_id: state_id, section: section
  end

  def self.special_by_state state_id
    where state_id: state_id, kind: 'Especial'
  end

  def self.find_boxes state_id, section
    (section == 'especiales') ? special_by_state(state_id) : by_state_and_section(state_id, section)
  end

  def has_results?
    !self.result.new?
  end
  
  def self.search_by_state_and_section(state, section)
    where('state_id = ? AND section = ?',state, section).all
  end
  
end