def partition(arr, num)
  first = []
  second = []
  final = []

  arr.each do |ele|
    if ele < num
      first << ele
    else
      second << ele
    end
  end

  final << first << second
  final
end

def merge(hash_1, hash_2)
  new_hash = {}

  hash_1.each {|key, value| new_hash[key] = value}
  hash_2.each {|key, value| new_hash[key] = value}

  new_hash
end

def censor(sentence, curse_words)
  vowels = "aeiou"
  sentence_arr = sentence.split(" ")

  sentence_arr.map! do |word|
    if curse_words.include?(word.downcase)
      new_word = ""

      word.each_char do |char|
        if vowels.include?(char.downcase)
          new_word += "*"
        else
          new_word += char
        end
      end

      new_word
    else
      word
    end
  end

  sentence_arr.join(" ")
end

def power_of_two?(num)
  (0..num).each do |count|
    if 2 ** count == num
      return true
    end
  end
  
  false
end

puts power_of_two?(1)