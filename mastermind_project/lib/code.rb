class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? do |char|
      POSSIBLE_PEGS.has_key?(char.upcase)
    end
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample } 
    Code.new(random_pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "There are invalid pegs"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    correct = 0
    
    (0...guess.length).each do |idx|
      correct += 1 if guess[idx] == self[idx]
    end

    correct
  end

  def num_near_matches(guess)
    near_matches = 0

    (0...guess.length).each do |idx|
      if guess[idx] != self[idx] && self.pegs.include?(guess[idx])
        near_matches += 1
      end
    end

    near_matches
  end

  def ==(arg)
    self.pegs == arg.pegs
  end
end
