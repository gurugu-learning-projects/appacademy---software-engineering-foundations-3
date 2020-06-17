# Pascal's triangle is a 2-dimensional array with the shape of a pyramid. The top of the pyramid is the number 1. To generate further levels of the pyramid, every element is the sum of the element above and to the left with the element above and to the right. Nonexisting elements are treated as 0 when calculating the sum. For example, here are the first 5 levels of Pascal's triangle:

#       1
#      1 1
#     1 2 1
#    1 3 3 1
#   1 4 6 4 1

# Write a method pascals_triangle that accepts a positive number, n, as an argument and returns a 2-dimensional array representing the first n levels of pascal's triangle.




def pascals_triangle(num)
  triangle = [[1]]

  (1...num).each_with_index do |ele_1, idx_1|
    level = []

    (0..triangle.last.length).each_with_index do |ele_2, idx_2|
      first = idx_2 - 1 < 0 ? 0 : triangle.last[idx_2 - 1]
      second = triangle.last[idx_2] || 0
      level << first + second
    end

    triangle << level
  end

  triangle
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]
