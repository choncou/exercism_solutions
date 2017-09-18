class SumOfMultiples
  def initialize(*args)
    @nums = args.sort
  end

  def to(max)
    result = [0]

    result.tap do
      (@nums[0]...max).each do |x|
        result << x if @nums.any? { |num| x % num == 0 }
      end unless @nums.empty?
    end.reduce(:+)
  end
end

module BookKeeping
  VERSION = 1
end
