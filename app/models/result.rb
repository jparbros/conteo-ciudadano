class Result < ActiveRecord::Base

  #
  # Attributes Accesors
  #
  attr_accessible :box_id, :movimiento_ciudadano, :nueva_alianza, :null, :others, :pan, :prd, :pri, :pt, :pvem, :state

  #
  # Relations
  #
  belongs_to :box
  accepts_nested_attributes_for :box
  #
  # State Machine
  #
  state_machine :state, :initial => :new do

  end
end
