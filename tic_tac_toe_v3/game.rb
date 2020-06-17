require "./board.rb"
require "./human_player.rb"
require "./computer_player.rb"

class Game
  def initialize(n, players_list)
    @players = []
    
    players_list.each do |mark, is_computer_player| 
      if !is_computer_player
        @players << HumanPlayer.new(mark)
      else
        @players << ComputerPlayer.new(mark)
      end
    end

    @board = Board.new(n)
    @current_player = @players.first
  end

  def switch_turn
    @players = @players.rotate
    @current_player = @players.first
  end

  def play
    while @board.empty_positions?
      @board.print

      position = @current_player.get_position(@board.legal_positions)
      @board.place_mark(position.split(",").map(&:to_i), @current_player.mark)

      if @board.win?(@current_player.mark)
        puts "Player #{@current_player.mark} has won!"
        return
      end

      self.switch_turn
    end

    @board.print
  end
end