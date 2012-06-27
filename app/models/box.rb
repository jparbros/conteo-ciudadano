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
  has_many :result_images

  #
  # Nested attributes
  #
  accepts_nested_attributes_for :result

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

  def self.to_verified
    includes(:result).where('results.state = ?','ready_to_revision')
  end

  def has_results?
    self.result.present? || !self.result.new?
  end

end