def is_prime?(num)
  return false if num < 2

  (2..num / 2).all? do |factor|
    num % factor != 0
  end
end

def nth_prime(n)
  number = 2
  primes = []

  while primes.length < n
    if is_prime?(number)
      primes << number
    end

    number += 1
  end

  primes.last
end

def prime_range(min, max)
  primes = []

  (min..max).each do |factor|
    if is_prime?(factor)
      primes << factor
    end
  end

  primes
end