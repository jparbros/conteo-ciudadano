class HistoricalResult < ActiveRecord::Base
  attr_accessible :amlo, :epn, :jvm, :nulls, :others, :quadri, :totals
end
