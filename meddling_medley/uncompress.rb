# Write a method uncompress that accepts a string as an argument. The string will be formatted so every letter is followed by a number. The method should return an "uncompressed" version of the string where every letter is repeated multiple times given based on the number that appears directly after the letter.


def uncompress(str)
  decoded_string = ""
  count = 1

  while count <= str.length
    decoded_string += str[count - 1] * str[count].to_i
    count += 2
  end

  decoded_string
end

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'
