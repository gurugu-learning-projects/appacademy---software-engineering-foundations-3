def element_count(elements)
  count = Hash.new(0)

  elements.each { |ele| count[ele] += 1 }

  count
end

def char_replace!(str, chars)
  str.each_char.with_index do |char, idx|
    if chars.include?(char)
      str[idx] = chars[char]
    end
  end

  str
end

def product_inject(numbers)
  numbers.inject { |product, number| product *= number }
end