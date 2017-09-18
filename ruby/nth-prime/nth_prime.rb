class Prime
  def self.nth(n)
    raise ArgumentError.new if n == 0
    primes = []
    current = 2
    until primes.length == n
      primes << current if current.is_prime?
      current += 1
    end
    primes.last
  end

  def self.nths(n)
    raise ArgumentError.new if n == 0
    primes = [2]
    current = 3
    until primes.length == n
      primes << current if current.is_prime?
      current += 2
    end
    primes.last
  end
end

class Integer
  def is_prime?
    return false if self <= 1
    2.upto(Math.sqrt(self).to_i) do |x|
      return false if self%x == 0
    end
    true
  end
end

class BookKeeping
  VERSION = 1
end
