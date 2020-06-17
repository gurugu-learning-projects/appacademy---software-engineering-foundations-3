# Write a method silly_talk that accepts a sentence as an argument. The method should translate each word of the sentence according to the following rules:

# if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
# if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.


def silly_talk(sentence)
  vowels = "aeiou"
  words = sentence.split(" ")
  new_sentence = []

  words.each do |word|
    if vowels.include?(word[-1])
      new_sentence << word + word[-1]
    else
      new_word = ""

      word.each_char do |char|
        if vowels.include?(char.downcase)
          new_word += char + "b" + char.downcase
        else
          new_word += char
        end
      end

      new_sentence << new_word
    end
  end

  new_sentence.join(" ")
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"
