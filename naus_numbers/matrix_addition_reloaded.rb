# Write a method matrix_addition_reloaded that accepts any number of matrices as arguments. The method should return a new matrix representing the sum of the arguments. Matrix addition can only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height" and "width", then return nil.

def matrix_addition(matrix_1, matrix_2)
  (0...matrix_1.length).map do |ele_1|
    (0...matrix_1.first.length).map do |ele_2|
      matrix_1[ele_1][ele_2] + matrix_2[ele_1][ele_2]
    end
  end
end


def matrix_addition_reloaded(*matrices)
  # if matrices.length == 1
  #   return matrices[0]
  # end

  # (0...matrices.first.length).map do |ele_1|
  #   (0...matrices.first.first.length).map do |ele_2|
  #     total = 0
  #     (0...matrices.length).each do |ele_3|
  #       if matrices[ele_3].length != matrices.first.length
  #         return nil
  #       end

  #       total += matrices[ele_3][ele_1][ele_2]
  #     end
  #     total
  #   end
  # end    matrix = matrices.first
  matrix = matrices.first
  height = matrix.length
  width = matrix[0].length

  empty_matrix = Array.new(height) { [0] * width }
  matrices.inject(empty_matrix) do |m1, m2|
      return nil if m2.length != height or m2[0].length != width
      matrix_addition(m1, m2)
  end
end

# [[2,5], [4,7]] --- [[9,1], [3,0]] --- [[0, 0], [12, 4], [6, 3]]

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0, 0], [12, 4], [6, 3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
