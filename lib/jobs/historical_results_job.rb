class HistoricalResultsJob

  @queue = :HistoricalResults

  def self.perform(options = nil)
    HistoricalResult.new.get_historical_results
  end

end