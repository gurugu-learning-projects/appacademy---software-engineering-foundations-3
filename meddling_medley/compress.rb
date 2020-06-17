# Write a method compress that accepts a string as an argument. The method should return a "compressed" version of the string where streaks of consecutive letters are translated to a single appearance of the letter followed by the number of times it appears in the streak. If a letter does not form a streak (meaning that it appears alone), then do not add a number after it.


def compress(str)
  new_str = ""
  current_char = ""
  count = 0

  str.each_char do |char|
    if current_char != char && count > 1
      new_str += current_char + count.to_s
      current_char = char
      count = 1
    elsif current_char != char
      new_str += current_char
      current_char = char
      count = 1
    else
      count += 1
    end
  end

  if count > 1
    new_str += current_char + count.to_s
  else
    new_str += current_char
  end

  new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
