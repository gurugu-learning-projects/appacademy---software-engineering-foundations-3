def no_dupes?(arr)
  unique = []

  arr.each_with_index do |ele, idx|
    if arr.count(ele) == 1
      unique << ele
    end
  end

  unique
end

p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
p no_dupes?([true, true, true])            # => []
