class Authentication < ActiveRecord::Base
  #
  # Attributes Accessors
  #
  attr_accessible  :provider, :uid, :user_id, :token, :secret

  #
  # Associations
  #
  belongs_to :user
end
