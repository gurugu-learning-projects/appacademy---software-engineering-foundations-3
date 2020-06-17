require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code)
    puts "exact matches: #{code.num_exact_matches(@secret_code)}"
    puts "near matches: #{code.num_near_matches(@secret_code)}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    guess = Code.from_string(gets.chomp)

    self.print_matches(guess)
    puts guess
    guess == @secret_code
  end
end
