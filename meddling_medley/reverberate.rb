# Write a method reverberate that accepts a sentence as an argument. The method should translate the sentence according to the following rules:

# words that are shorter than 3 characters are unchanged
# words that are 3 characters or longer are translated according to the following rules:
# if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
# if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
# Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.


def reverberate(sentence)
  vowels = "aeiou"
  words = sentence.split(" ")
  converted_sentence = []

  words.each do |word|
    if word.length < 3
      converted_sentence << word
    elsif vowels.include?(word[-1].downcase)
      converted_sentence << word + word[0].downcase + word[1..-1]
    else
      uppercase = word[0] == word[0].upcase ? true : false
      count = word.length - 1

      while count > 0
        if vowels.include?(word[count])
          new_word = word + word[count..-1]
          converted_sentence << new_word
          break
        end
        count -= 1
      end
    end
  end

  converted_sentence.join(" ")
end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"
