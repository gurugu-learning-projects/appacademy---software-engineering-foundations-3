def vowel_rotate(str)
  new_str = str[0..-1]
  vowels = "aeiou"
  
  vowel_indices = (0...str.length).select {|i| vowels.include?(str[i])}
  new_vowel_indices = vowel_indices.rotate(-1)

  vowel_indices.each_with_index do |vowel_idx, i|
    new_vowel = str[new_vowel_indices[i]]
    new_str[vowel_idx] = new_vowel
  end

  new_str
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"
