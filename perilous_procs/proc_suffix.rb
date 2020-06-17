# Write a method proc_suffix that accepts a sentence and a hash as arguments. The hash contains procs as keys and suffix strings as values. The method should return a new sentence where each word of the original sentence is appended with a suffix if the original word returns true when given to the corresponding proc key. If an original word returns true for multiple procs, then the suffixes should be appended in the order that they appear in the input hash.


def proc_suffix(sentence, suffix_procs)
  words = sentence.split(" ")
  procs = suffix_procs.keys

  words.each_with_index do |word, idx|
    procs.each do |prc|
      if prc.call(word)
        words[idx] += suffix_procs[prc]
      end
    end
  end

  words.join(" ")
end

contains_a = Proc.new { |w| w.include?('a') }
three_letters = Proc.new { |w| w.length == 3 }
four_letters = Proc.new { |w| w.length == 4 }

p proc_suffix('dog cat',
    contains_a => 'ly',
    three_letters => 'o'
)   # "dogo catlyo"

p proc_suffix('dog cat',
    three_letters => 'o',
    contains_a => 'ly'
)   # "dogo catoly"

p proc_suffix('wrong glad cat',
    contains_a => 'ly',
    three_letters => 'o',
    four_letters => 'ing'
)   # "wrong gladlying catlyo"

p proc_suffix('food glad rant dog cat',
    four_letters => 'ing',
    contains_a => 'ly',
    three_letters => 'o'
)   # "fooding gladingly rantingly dogo catlyo"
