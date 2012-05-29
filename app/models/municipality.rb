class Municipality < ActiveRecord::Base
  
  belongs_to :state
  attr_accessible :name, :state_id, :number
  
  validates :name, :presence => true
  validates :state_id, :presence => true, :numericality => { :only_integer => true }
  validates :number, :presence => true, :numericality => { :only_integer => true }

end