class ExtractTuitsJob
  @queue = :ExtractTuits

  def self.perform(options = nil)
    Extractor.extract_tuits
  end

end