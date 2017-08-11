class LRUCache
  def initialize(len)
    @length = len
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if include?(el)
      move_to_first(el)
    elsif full?
      remove_oldest
      add_new(el)
    else
      add_new(el)
    end
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
    count == @length
  end

  def move_to_first(el)
    ind = @cache.index(el)
    unless ind == count - 1
      @cache = @cache[0...ind] + @cache[ind + 1..-1] + [el]
    end
  end

  def include?(el)
    @cache.include?(el)
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

p johnny_cache.show == [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
