class Box < ActiveRecord::Base
  belongs_to :state

  attr_accessible :state_id, :number, :location, :address, :references, :section, :district, :active


end