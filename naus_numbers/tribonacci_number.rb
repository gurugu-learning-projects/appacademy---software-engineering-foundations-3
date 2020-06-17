# The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the tribonacci sequence are 1, 1, and 2. To generate the next number of the sequence, we take the sum of the previous three numbers. The first six numbers of tribonacci sequence are:

# 1, 1, 2, 4, 7, 13, ... and so on

# Write a method tribonacci_number that accepts a number argument, n, and returns the n-th number of the tribonacci sequence.


def tribonacci_number(n)
  if n == 1 || n == 2
    return 1
  elsif n == 3
    return 2
  end

  tribonacci_number(n - 1) + tribonacci_number(n - 2) + tribonacci_number(n - 3)
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274
