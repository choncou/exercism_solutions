class Sieve
  attr_reader :primes

  def initialize(max)
    @max = max
    @range = (2..max).to_a
    @primes = []
    sieve
  end

  private

  def sieve(n=0)
    @range.each do |current|
      if current.is_a? Integer
        @primes << current
        mark_multiples(current)
      end
    end
  end

  def mark_multiples(number, times=1)
    num = number*times
    return if num > @max
    @range[num-2] = :x
    mark_multiples(number, times+1)
  end
end

module BookKeeping
  VERSION = 1
end
