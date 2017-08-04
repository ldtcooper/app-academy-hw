class Map
  def initialize
    @map = []
  end

  def assign(k, v)
    @map << [k, v] if @map.none? { |entry| entry.first == k }
  end

  def lookup(k)

  end

  def remove(k)

  end

  def show

  end
end
