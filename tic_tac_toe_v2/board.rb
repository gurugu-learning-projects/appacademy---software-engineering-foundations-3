class Board
  attr_reader :grid

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, "_")}
  end

  def valid?(position)
    @grid.length - 1 >= position[0] && @grid.length - 1 >= position[1]
  end

  def empty?(position)
    @grid[position[0]][position[1]] == "_"
  end

  def place_mark(position, mark)
    if !self.valid?(position)
      raise "Provided position is outside the grid"
    elsif !self.empty?(position)
      raise "Provided position is not empty"
    else
      @grid[position[0]][position[1]] = mark
    end
  end

  def print
    @grid.each do |row|
      p row
    end
  end

  def win_row?(mark)
    @grid.any? do |row|
      row.all? {|pos| pos == mark}
    end
  end

  def win_col?(mark)
    @grid.transpose.any? do |row|
      row.all? {|pos| pos == mark}
    end
  end

  def win_diagonal?(mark)
    diagonal_1 = []
    diagonal_2 = []

    @grid.each_with_index do |row, idx|
      diagonal_1 << row[idx]
      diagonal_2 << row.reverse[idx]
    end

    diag_1_true = diagonal_1.all? {|pos| pos == mark}
    diag_2_true = diagonal_2.all? {|pos| pos == mark}

    diag_1_true || diag_2_true
  end

  def win?(mark)
    self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark)
  end

  def empty_positions?
    self.grid.each do |row|
      if row.include?("_")
        return true
      end
    end

    false
  end
end

# new_board = Board.new

# p new_board.place_mark([0,0], "X")
# p new_board.place_mark([0,1], "X")
# p new_board.place_mark([0,2], "X")
# p new_board.place_mark([1,0], "X")
# p new_board.place_mark([1,1], "X")
# p new_board.place_mark([1,2], "X")
# p new_board.place_mark([2,0], "X")
# p new_board.place_mark([2,1], "X")
# p new_board.place_mark([2,2], "X")
# p new_board.grid
# p new_board.empty_positions?