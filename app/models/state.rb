class State < ActiveRecord::Base
  #
  # Attributes Accesors
  #
  attr_accessible :name

  #
  # Validations
  #
  validates :name, :presence => true

  def self.find_by_name_and_variants(state)
    where("state = ? and variants @@ ?", state, state)
  end
end
