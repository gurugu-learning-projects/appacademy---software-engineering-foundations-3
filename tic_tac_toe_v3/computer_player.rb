class ComputerPlayer
  attr_reader :mark

  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    position = legal_positions.sample

    p "Player #{@mark} chose the following position: #{position}"

    position
  end
end