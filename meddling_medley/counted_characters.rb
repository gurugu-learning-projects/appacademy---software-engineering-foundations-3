# Write a method counted_characters that accepts a string as an argument. The method should return an array containing the characters of the string that appeared more than twice. The characters in the output array should appear in the same order they occur in the input string.


def counted_characters(str)
  chars = Hash.new(0)
  counted_chars = []

  str.split("").each do |char|
    chars[char] += 1
  end

  chars.keys.each do |key|
    if chars[key] > 2
      counted_chars << key
    end
  end

  counted_chars
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []
