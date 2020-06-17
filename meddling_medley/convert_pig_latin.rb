# Write a method convert_pig_latin that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word begins with a vowel, simply add 'yay' to the end of the word (example: 'eat'->'eatyay')
# if the word begins with a non-vowel, move all letters that come before the word's first vowel to the end of the word and add 'ay' (example: 'trash'->'ashtray')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.


def convert_pig_latin(sentence)
  vowels = "aeiou"
  words = sentence.split(" ")
  converted_sentence = []

  words.each do |word|
    if word.length < 3
      converted_sentence << word
    elsif vowels.include?(word[0].downcase)
      converted_sentence << word + "yay"
    else
      uppercase = word[0] == word[0].upcase ? true : false

      word.each_char.with_index do |char, idx|
        if vowels.include?(char)
          first_char = uppercase ? char.upcase : char;
          new_word = first_char + word[idx + 1..-1] + word[0].downcase + word[1...idx] + "ay"
          converted_sentence << new_word
          break
        end
      end

    end
  end

  converted_sentence.join(" ")
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"
