class Triangle
  def initialize(sides)
    @sides = sides
    @size_count = @sides.each_with_object(Hash.new(0)) { |side, memo| memo[side] += 1 }
  end

  def equilateral?
    @size_count.size == 1 && valid_triangle?
  end

  def isosceles?
    @size_count.size <= 2 && valid_triangle?
  end

  def scalene?
    @size_count.size == 3 && valid_triangle?
  end

  private

  def valid_triangle?
    a, b, c = @sides
    @sides.all? { |side| side != 0 } && (a+b >= c && b+c >= a && a+c >= b)
  end
end

module BookKeeping
  VERSION = 1
end
