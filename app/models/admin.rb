class Admin < ActiveRecord::Base

  #
  # Devise Modules
  #
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  #
  # Attributes accesors
  #
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role
  cattr_accessor :current

  #
  # Associations
  #
  has_many :tickets

  ROLES = %w[superadmin admin manager observer]

end
