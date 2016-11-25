class Squares
  def initialize(n)
    @number = n
  end

  def square_of_sum
    @square_of_sum ||= (0..@number).inject(&:+) ** 2 
  end

  def sum_of_squares
    @sum_of_squares ||= (0..@number).map { |x| x ** 2 }.inject(&:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end