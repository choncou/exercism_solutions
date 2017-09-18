class Grains
  SQUARES = (0...64).inject([]) { |board, n| board << 2 ** n }.freeze

  def self.square(n)
    throw ArgumentError.new if (n <= 0) || (n>64)
    SQUARES[n-1]
  end

  def self.total
    SQUARES.inject(:+)
  end
end

module BookKeeping
  VERSION = 1
end
