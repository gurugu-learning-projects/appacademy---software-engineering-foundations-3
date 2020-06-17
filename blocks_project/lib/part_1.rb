def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject {|puppy| puppy["age"] <= 2}
end

def count_positive_subarrays(arr)
  arr.count {|subarr| subarr.sum > 0}
end

def aba_translate(str)
  vowels = "aeiou"
  aba_str = ""

  str.each_char do |char|
    aba_str += char
    aba_str += "b" + char if vowels.include?(char)
  end

  aba_str
end

def aba_array(arr)
  arr.map { |word| aba_translate(word)}
end