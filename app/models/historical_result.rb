class HistoricalResult < ActiveRecord::Base
  #
  # Attributes accessors
  #
  attr_accessible :amlo, :epn, :jvm, :nulls, :others, :quadri, :totals

  #
  # Callbacks
  #
  before_save :get_totals

  #
  # Modules
  #
  include ResultProcessor

  def get_totals
    self.totals = jvm + epn + amlo + quadri + nulls + others
  end
end
