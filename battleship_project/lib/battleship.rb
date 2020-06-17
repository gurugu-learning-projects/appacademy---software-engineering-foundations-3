require_relative "board"
require_relative "player"

class Battleship
  attr_reader :player, :board

  def initialize(length)
    @player = Player.new
    @board = Board.new(length)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts "Number of ships: #{@board.num_ships}"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose!"
      return true
    else
      return false
    end
  end

  def win?
    if @board.num_ships > 1
      return false
    else
      puts "you win!"
      return true
    end
  end

  def game_over?
    if self.lose? || self.win?
      return true
    else
      return false
    end
  end

  def turn
    coords = @player.get_move

    if !@board.attack(coords)
      @remaining_misses -= 1
    end

    @board.print
    puts "Remaining misses: #{@remaining_misses}"
  end
end
