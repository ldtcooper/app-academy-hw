class LRUCache
  def initialize(len)
    @length = len
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    remove_oldest if full?
    add_new(el)
  end

  def show
    @cache.dup
  end

  private

  def add_new(el)
    @cache.push(el)
  end

  def remove_oldest
    @cache.shift
  end

  def full?
    @cache.length == @length
  end
end

# class LinkedList
#   def initialize(next_el, prev_el, obj = nil)
#     @next_el = next_el
#     @prev_el = prev_el
#     @obj = obj
#   end
#
#   attr_accessor :next_el, :prev_el, :obj
# end
