# Write a method strange_sums that accepts an array of numbers as an argument. The method should return a count of the number of distinct pairs of elements that have a sum of zero. You may assume that the input array contains unique elements.


def strange_sums(numbers)
  sums = 0

  (0...numbers.length).each do |idx_1|
    (idx_1 + 1...numbers.length).each do |idx_2|
      if numbers[idx_1] + numbers[idx_2] == 0
        sums += 1
      end  
    end
  end
  
  sums
end

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
