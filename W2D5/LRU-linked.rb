class LRUCache
  def initialize(len)
    @length = len
    @cache = {}
  end

  def count
    @cache.length
  end

  def add(name, el)

  end

  def show
    @cache.dup
  end

  private

  def add_new(name, el)
    @cache[name] =
  end

  def remove_oldest

  end

  def full?
    count == @length
  end

  def move_to_first(el)

  end

  def include?(el)

  end
end

class LinkedList
  def initialize(next_link, prev_link, obj = nil)
    @next_link = next_link
    @prev_link = prev_link
    @obj = obj
  end

  attr_accessor :next_link, :prev_link, :obj

  

  private

  def head?
    @prev_link.nil?
  end


  def tail?
    @next_link.nil?
  end
end
