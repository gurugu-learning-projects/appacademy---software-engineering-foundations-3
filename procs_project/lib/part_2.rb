def reverser(str, &prc)
  reversed = str.split("").reverse().join("")
  prc.call(reversed)
end

def word_changer(sentence, &prc)
  new_sentence = []

  sentence.split(" ").each { |word| new_sentence << prc.call(word) }

  new_sentence.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  res_1 = prc_1.call(num)
  res_2 = prc_2.call(num)

  res_1 > res_2 ? res_1 : res_2
end

def and_selector(arr, prc_1, prc_2)
  arr.select { |ele| prc_1.call(ele) && prc_2.call(ele) }
end

def alternating_mapper(arr, prc_1, prc_2)
  new_arr = []

  arr.each_with_index do |ele, idx|
    idx.even? ? new_arr << prc_1.call(ele) : new_arr << prc_2.call(ele)
  end
  
  new_arr
end