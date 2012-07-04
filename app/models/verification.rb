class Verification < ActiveRecord::Base
  #
  # Attributes accessors
  #
  attr_accessible :box_id, :checker_ip, :user_id

  #
  # Asociations
  #
  belongs_to :user
  belongs_to :box

end
