# Write a method squaragonal? that accepts 2-dimensional array as an argument. The method should return a boolean indicating whether or not the array contains all of the same element across either of its diagonals. You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squaragonal?(two_dim_array)
  rotated_1 = two_dim_array.map.with_index do |arr, idx|
    arr.rotate(idx)
  end
  rotated_2 = two_dim_array.map.with_index do |arr, idx|
    arr.rotate(arr.length - idx - 1)
  end

  transposed_1 = rotated_1.transpose
  transposed_2 = rotated_2.transpose

  true_1 = transposed_1.any? do |arr|
    uniqued = arr.uniq
    uniqued.length == 1
  end

  true_2 = transposed_2.any? do |arr|
    uniqued = arr.uniq
    uniqued.length == 1
  end

  true_1 || true_2
end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false
