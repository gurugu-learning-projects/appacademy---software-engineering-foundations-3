class HumanPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark.to_s
  end

  def get_position(legal_positions)
    p "Player #{@mark}"
    p "Please enter row, column position values divided by coma:"
    position = gets.chomp.split(",").map(&:strip).join(",")

    if !legal_positions.include?(position)
      p "You entered: #{position}"
      p "Please enter valid position in the format 'row_num, col_num'"
      p "----------------------------------------------"
      return self.get_position(legal_positions)
    end

    p "You entered: #{position}"

    position
  end
end

# human_player = HumanPlayer.new("^_^")
# p human_player.get_position