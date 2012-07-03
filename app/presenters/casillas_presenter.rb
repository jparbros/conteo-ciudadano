class CasillasPresenter
  include Enumerable

  def initialize(collection = [], current_user = nil)
    @collection = collection
    @casillas = []
    collection.each do |casilla|
      @casillas << CasillaPresenter.new(casilla, current_user)
    end
  end

  def each &blk
    @casillas.each &blk
  end

  def method_missing(method_name)
    @collection.send(method_name)
  end
end