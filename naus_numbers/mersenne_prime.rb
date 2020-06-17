# A "Mersenne prime" is a prime number that is one less than a power of 2. This means that it is a prime number with the form 2^x - 1, where x is some exponent. For example:

# 3 is a Mersenne prime because it is prime and 3 = 2^2 - 1
# 7 is a Mersenne prime because it is prime and 7 = 2^3 - 1
# 11 is not a Mersenne prime because although it is prime, it does not have the form 2^x - 1

# The first three Mersenne primes are 3, 7, and 31. Write a method mersenne_prime that accepts a number, n, as an argument and returns the n-th Mersenne prime.


def is_prime?(num)
  if num < 2
    return false
  end

  (2..num / 2).each do |factor|
    if num % factor == 0
      return false
    end
  end

  true
end

def mersenne_prime(n)
  m_primes = []
  count = 2

  while m_primes.length < n
    if is_prime?(count - 1)
      m_primes << count - 1
    end

    count *= 2
  end

  m_primes.last
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
