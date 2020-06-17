def is_prime?(num)
  return false if num < 2
  (2...num / 2).none? {|idx| num % idx == 0}
end

def get_primes(num)
  (2..num).select do |factor|
    num % factor == 0 && is_prime?(factor)
  end
end

def bi_prime?(num)
  primes = get_primes(num)

  primes.any? do |prime|
    div = num / prime
    primes.include?(div)
  end
end

p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false
