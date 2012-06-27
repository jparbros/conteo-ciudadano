class State < ActiveRecord::Base
  #
  # Attributes Accesors
  #
  attr_accessible :name

  #
  # Validations
  #
  validates :name, :presence => true
end
