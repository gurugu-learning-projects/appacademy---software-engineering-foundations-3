require "./board.rb"
require "./human_player.rb"

class Game
  def initialize(n, *player_marks)
    @players = player_marks.map {|mark| HumanPlayer.new(mark)}
    @board = Board.new(n)
    @current_player = @players.first
  end

  def switch_turn
    # current_player_idx = @players.index do |player| 
    #   player.mark == @current_player.mark
    # end
    
    # @current_player = @players[(current_player_idx + 1) % @players.length]
    @players = @players.rotate
    @current_player = @players.first
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