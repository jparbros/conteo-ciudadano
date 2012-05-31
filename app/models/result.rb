class Result < ActiveRecord::Base

  #
  # Attributes Accesors
  #
  attr_accessible :box_id, :movimiento_ciudadano, :nueva_alianza, :null, :others, :pan, :prd, :pri, :pt, :pvem, :state

  #
  # Relations
  #
  belongs_to :box

  #
  # State Machine
  #
  state_machine :state, :initial => :new do

  end
end
