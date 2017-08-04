class Map
  def initialize
    @map = []
  end

  def assign(k, v)
    @map << [k, v] if @map.none? { |ent| ent.first == k }
  end

  def lookup(k)
    @map.each do |ent|
      return ent.last if ent.first == k
    end
  end

  def remove(k)

  end

  def show
    @map
  end
end
