class Box < ActiveRecord::Base
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

end