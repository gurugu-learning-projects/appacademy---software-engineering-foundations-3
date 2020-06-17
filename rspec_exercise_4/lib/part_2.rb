def proper_factors(num)
  factors = []

  (1..num / 2).each do |factor|
    factors << factor if factor > 0 && num % factor == 0
  end

  factors
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  if num == aliquot_sum(num)
    return true
  end

  false
end

def ideal_numbers(n)
  numbers = []
  count = 1

  while numbers.length < n
    if perfect_number?(count)
      numbers << count
    end
    
    count += 1
  end

  numbers
end