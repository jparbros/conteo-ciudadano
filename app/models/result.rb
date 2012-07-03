class Result < ActiveRecord::Base

  #
  # Attributes Accesors
  #
  attr_accessible :box_id, :movimiento_ciudadano, :nueva_alianza, :null, :others, :pan, :prd, :pri, :pt, :pvem, :pri_pvem, :prd_pt_mc, :prd_pt, :prd_mc, :pt_mc

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

    event :back do
      transition ready_to_revision: :new
    end

    event :filled do
      transition new: :ready_to_revision
    end

    event :approved do
      transition [:ready_to_revision, :rejected, :reported] => :verified
    end

    event :rejecting do
      transition ready_to_revision: :rejected
    end

    event :reporting do
      transition verified: :reported
    end
  end

  #
  # Simple audit
  #
  simple_audit username_method: :email do |result|
    {
      movimiento_ciudadano: result.movimiento_ciudadano,
      nueva_alianza: result.nueva_alianza,
      null: result.null,
      others: result.others,
      pan: result.pan,
      prd: result.prd,
      pri: result.pri,
      pt: result.pt,
      pvem: result.pvem,
      pri_pvem: result.pri_pvem,
      prd_pt_mc: result.prd_pt_mc,
      prd_pt: result.prd_pt,
      prd_mc: result.prd_mc,
      pt_mc: result.pt_mc
    }
  end

  def self.count_total
    self.count
  end

  def self.count_to_verified
    where(state: 'ready_to_revision').count
  end

  def self.count_verified
    where(state: 'verified').count
  end

  def self.count_rejected
    where(state: 'rejected').count
  end

  def captured?
    (pan||0) > 0 && (pri||0) > 0 && (prd||0) > 0
  end
end
