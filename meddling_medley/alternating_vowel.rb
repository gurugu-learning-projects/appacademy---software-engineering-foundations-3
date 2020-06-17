# Write a method alternating_vowel that accepts a sentence as an argument. The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:

# the 1st word should be missing its first vowel
# the 2nd word should be missing its last vowel
# the 3rd word should be missing its first vowel
# the 4th word should be missing its last vowel
# ... and so on
# Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.


def alternating_vowel(sentence)
  vowels = "aeiou"
  words = sentence.split(" ")
  new_sentence = []

  words.each_with_index do |word, idx_word|
    new_word = ""
    modified = false

    if idx_word.even?
      word.each_char.with_index do |char, idx_char|
        if modified || !vowels.include?(char)
          new_word += char
        else
          modified = true
        end
      end
    else
      count = word.length - 1

      while count >= 0
        if modified || !vowels.include?(word[count])
          new_word = word[count] + new_word
        else
          modified = true
        end

        count -= 1
      end

    end

    new_sentence << new_word
  end

  new_sentence.join(" ")
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"
