class Result < ActiveRecord::Base

  #
  # Attributes Accesors
  #
  attr_accessible :box_id, :movimiento_ciudadano, :nueva_alianza, :null, :others, :pan, :prd, :pri, :pt, :pvem, :state, :pri_pvem, :prd_pt_mc, :prd_pt, :prd_mc, :pt_mc

  #
  # Relations
  #
  belongs_to :box

  #
  # State Machine
  #
  state_machine :state, :initial => :new do
    state :ready_to_revision
    state :verified
    state :rejected
    state :reported

    event :filled do
      transition new: :ready_to_revision
    end

    event :approved do
      transition ready_to_revision: :verified
    end

    event :rejecting do
      transition ready_to_revision: :rejected
    end

    event :reporting do
      transition verified: :reported
    end
  end
end
