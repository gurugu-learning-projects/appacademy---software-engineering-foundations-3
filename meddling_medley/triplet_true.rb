# Write a method triplet_true? that accepts a string as an argument and returns a boolean indicating whether or not the string contains three of the same character consecutively.


def triplet_true?(str)
  current_char = ""
  current_count = 0

  str.each_char do |char|
    if char == current_char
      current_count += 1
      if current_count > 2
        return true
      end
    else
      current_char = char
      current_count = 1
    end
  end

  false
end

p triplet_true?('caaabb')        # true
p triplet_true?('terrrrrible')   # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false
