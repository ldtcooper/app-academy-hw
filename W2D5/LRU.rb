class LRUCache
  def initialize(len)
    @length = len
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
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

  def move_to_first(el)

  end

  def repeat?

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

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count == 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

p johnny_cache.show #== [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
