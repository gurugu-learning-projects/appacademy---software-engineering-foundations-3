def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(num_arr)
  num_arr.sum / num_arr.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(sentence)
  sentenceArr = sentence.split(" ")
  sentenceArr.each_with_index do |word, idx|
    if idx == 0 || idx % 2 == 0
      sentenceArr[idx] = word.upcase
    else
      sentenceArr[idx] = word.downcase
    end
  end

  return sentenceArr.join(" ")
end