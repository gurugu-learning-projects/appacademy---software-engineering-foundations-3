def hipsterfy(word)
  vowels = "aeiou"
  i = word.length - 1

  while i >= 0
    if vowels.include?(word[i])
      word[i] = ""
      return word
    end
    i -= 1
  end

  word
end

def vowel_counts(str)
  vowels = "aeiou"
  vowels_count = Hash.new(0)

  str.each_char do |char|
    if vowels.include?(char.downcase)
      vowels_count[char.downcase] += 1
    end
  end

  vowels_count
end

def caesar_cipher(msg, num)
  nums = "0123456789"
  final = ""

  msg.each_char do |char|
    if char =~ /[a-z]/
      char_code = char.ord - 97
      final += (((char_code + num) % 26) + 97).chr
    else
      final += char
    end
  end

  final
end