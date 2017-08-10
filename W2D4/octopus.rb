fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish',
  'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# should run in O(n^2)
def sluggish(arr)
  biggest_fish = ""
  arr.each do |el1|
    arr.each do |el2|
      el1.length > el2.length ? biggest_fish = el1 : el2
    end
  end
  biggest_fish
end

# should run in O(n log n)
def dominant(arr)
  return arr if arr.length < 2
  mid = arr.length / 2
  left = dominant(arr[0...mid])
  right = dominant(arr[mid..-1])
  i, j = 0, 0
  new_arr = []
  while i < left.length && j < right.length
    if arr[i].length <= arr[j].length
      new_arr << arr[i]
      i += 1
    else
      new_arr << arr[j]
      j += 1
    end
  end
  new_arr + left[i..-1] + right[j..-1]
end

# should run in O(n)
def clever(arr)
  arr.inject("") do |acc, el|
    if el.length > acc.length
      el
    else
      acc
    end
  end
end

p sluggish(fish)
p dominant(fish).last
p clever(fish)
