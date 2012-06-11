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
  has_many :result_images

  #
  # Delegates
  #
  delegate :name, to: :state, prefix: true

  acts_as_gmappable

  def self.by_state_and_section state_id, section
    where state_id: state_id, section: section
  end

  def address_to_google
    URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{parsed_address}&sensor=false")
  end

  def parsed_address
    complete_address.gsub('#','').gsub(/\d{5}/,'').gsub(',','').lstrip
  end

  def complete_address
    unless address.downcase.match(state_name.downcase) || !address.downcase.match(/(avenida|calle|andador|carretera) #{state_name.downcase}/)
      "#{address} #{state_name.downcase}"
    else
      address
    end
  end

  def missing_state
     ((address.downcase.scan(state_name.downcase).size <= 1) && !!address.downcase.match(/(avenida|calle|andador|carretera) #{state_name.downcase}/))
  end
end