def longest_streak(str)
  longest = ""
  current = ""

  (0...str.length).each do |idx|
    if str[idx] == str[idx - 1] || idx == 0
      current += str[idx]
    else
      current = str[idx]
    end

    if current.length >= longest.length
      longest = current
    end
  end

  longest
end

p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'
