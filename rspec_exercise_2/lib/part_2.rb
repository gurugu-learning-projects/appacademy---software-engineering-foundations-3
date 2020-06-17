def palindrome?(str)
  str_arr = str.split("")

  str == str_arr.reverse!.join("")
end

def substrings(str)
  substrs = []

  str.each_char.with_index do |char1, idx1|
    substr = char1
    substrs << substr

    str.each_char.with_index do |char2, idx2|
      if idx2 > idx1
        substr += char2
        substrs << substr
      end
    end

  end

  substrs
end

def palindrome_substrings(str)
  substrs = substrings(str)

  substrs.select {|substr| substr.length > 1 && palindrome?(substr)}
end