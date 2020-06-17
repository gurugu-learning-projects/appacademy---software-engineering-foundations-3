def zip(*arrays)
  array = []

  (0...arrays[0].length).each do |arr_idx|
    array << []
    (0...arrays.length).each do |ele_idx|
      array[arr_idx] << arrays[ele_idx][arr_idx]
    end
  end

  array
end

def prizz_proc(arr, proc_1, proc_2)
  arr.select do |ele|
    (proc_1.call(ele) && !proc_2.call(ele)) ||
    (!proc_1.call(ele) && proc_2.call(ele))
  end
end

def zany_zip(*arrays)
  array = []
  max_array = arrays.max {|a, b| a.length <=> b.length }

  (0...max_array.length).each do |arr_idx|
    array << []
    (0...arrays.length).each do |ele_idx|
        array[arr_idx] << arrays[ele_idx][arr_idx]
    end
  end

  array
end

def maximum(arr, &prc)
  best = nil

  arr.each do |ele|
    if !best || prc.call(ele) >= prc.call(best)
      best = ele
    end
  end 

  best
end

def my_group_by(arr, &prc)
  results = Hash.new { |hash, key| hash[key] = [] }

  arr.each do |ele|
    results[prc.call(ele)] << ele
  end

  results
end

def max_tie_breaker(arr, prc_1, &prc_2)
  best = nil

  arr.each do |ele|
    if !best || prc_2.call(ele) > prc_2.call(best)
      best = ele
    elsif prc_2.call(ele) == prc_2.call(best)
      if prc_1.call(ele) > prc_1.call(best)
        best = ele
      end
    end
  end

  best
end

def silly_syllables(sentence)
  words = sentence.split(" ")
  result_sentence = []

  words.each do |word|
    first_index = word.index(/[aeiou]/)
    last_index = word.rindex(/[aeiou]/)

    if word.count("aeiou") < 2
      result_sentence << word
    else
      result_sentence << word[first_index..last_index]
    end
  end

  result_sentence.join(" ")
end