# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
  (2..num).reverse_each do |divisor|
    # debugger
    if num % divisor == 0 && is_prime?(divisor)
      return divisor
    end
  end
end

def is_prime?(num)
  if num < 2
    return false
  end

  (2..num/2).each do |i|
    return false if num % i == 0
  end

  true
end

def unique_chars?(str)
  str.each_char.with_index do |char, idx|
    return false if str.index(char, idx + 1)
  end

  true
end

def dupe_indices(arr)
  dupes_hash = {}

  arr.each do |char|

    dupes = find_dupes(char, arr)
    if dupes.length > 1
      dupes_hash[char] = dupes
    end
  end

  dupes_hash
end

def find_dupes(char, arr)
  dupes = []

  arr.each_with_index do |ele, idx|
    dupes << idx if ele == char
  end

  return dupes
end

def ana_array(arr_1, arr_2)
  return false if arr_1.length != arr_2.length

  arr_1.each_with_index do |ele1, idx1|
    return false if !arr_2.include?(ele1)

    arr_1_count = arr_1.count {|c_1| c_1 == ele1 }
    arr_2_count = arr_2.count {|c_2| c_2 == ele1 }

    return false if arr_1_count != arr_2_count
  end

  true
end