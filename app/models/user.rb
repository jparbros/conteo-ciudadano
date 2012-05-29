class User < ActiveRecord::Base
  attr_accessible :crypted_password, :email, :name,:password ,:password_confirmation, :password_salt, :perishable_token, :persistence_token, :single_access_token,:role
  
  acts_as_authentic do |c|
    # for available options see documentation in: Authlogic::ActsAsAuthentic
  end
  
  validates :name, :presence => true
  validates :role, :presence => true
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  
  ROLES = %w[admin manager box lector]
end