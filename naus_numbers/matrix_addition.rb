# Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts two matrices as arguments. The two matrices are guaranteed to have the same "height" and "width". The method should return a new matrix representing the sum of the two arguments. To add matrices, we simply add the values at the same positions:


def matrix_addition(matrix_1, matrix_2)
  (0...matrix_1.length).map do |ele_1|
    (0...matrix_1.first.length).map do |ele_2|
      matrix_1[ele_1][ele_2] + matrix_2[ele_1][ele_2]
    end
  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
