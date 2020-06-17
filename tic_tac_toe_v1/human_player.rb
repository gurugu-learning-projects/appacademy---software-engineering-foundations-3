class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position
    p "Player " + @mark
    p "Please enter row, column position values divided by coma:"
    position = gets.chomp
    position_to_a = position.split(",").map(&:to_i)

    if position_to_a.length != 2
      raise "Enter valid row, column position (e.g. '4, 1')"
    end

    p position_to_a
  end
end

# human_player = HumanPlayer.new("^_^")
# p human_player.get_position