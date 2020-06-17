# lucas_sequence
# The Lucas Sequence is a sequence of numbers. The first number of the sequence is 2. The second number of the Lucas Sequence is 1. To generate the next number of the sequence, we add up the previous two numbers. For example, the first six numbers of the sequence are: 2, 1, 3, 4, 7, 11, ...

# Write a method lucasSequence that accepts a number representing a length as an arg. The method should return an array containing the Lucas Sequence up to the given length. Solve this recursively.

def lucasSequence(num)
  if num == 0
    return []
  elsif num == 1
    return [2]
  elsif num == 2
    return [2, 1]
  end

  result = lucasSequence(num - 1)

  result.concat([result[-1] + result[-2]])
end

# Examples
p lucasSequence(0)   # => []
p lucasSequence(1)   # => [2]    
p lucasSequence(2)   # => [2, 1]
p lucasSequence(3)   # => [2, 1, 3]
p lucasSequence(4)   # => [2, 1, 3, 4]
p lucasSequence(5)   # => [2, 1, 3, 4, 7]
p lucasSequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucasSequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
