require "byebug"

class Board
  attr_reader :size

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def [](coords)
    row, col = coords
    @grid[row][col]
  end

  def []=(coords, value)
    row, col = coords
    @grid[row][col] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end

  def attack(coords)
    if self[coords] == :S
      self[coords] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[coords] = :X
      return false
    end
  end

  def place_random_ships
    total_ships = self.size / 4
    grid_cells = []

    @grid.each_with_index do |row, idx_1|
      row.each_with_index do |column, idx_2|
        grid_cells << [idx_1, idx_2]
      end
    end

    random_coords = grid_cells.sample(total_ships)

    random_coords.each do |coords|
      self[coords] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |ele|
        if ele == :S
          :N
        else
          ele
        end
      end
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
