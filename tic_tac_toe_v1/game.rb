require "./board.rb"
require "./human_player.rb"

class Game
  def initialize(player_1_mark, player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @board = Board.new()
    @current_player = @player_1
  end

  def switch_turn
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end

  def play
    while @board.empty_positions?
      @board.print

      position = @current_player.get_position
      @board.place_mark(position, @current_player.mark)

      if @board.win?(@current_player.mark)
        puts "Player " + @current_player.mark + " has won!"
        return
      end

      self.switch_turn
    end
  end
end