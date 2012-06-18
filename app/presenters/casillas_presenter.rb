class CasillasPresenter
  include Enumerable

  def initialize(collection = [], current_user = nil)
    @casillas = []
    collection.each do |casilla|
      @casillas << CasillaPresenter.new(casilla, current_user)
    end
  end

  def each &blk
    @casillas.each &blk
  end

end