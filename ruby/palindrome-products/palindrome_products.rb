class Palindromes
  def initialize(max_factor: 0, min_factor: 0)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    @results = {}

    (@min_factor..@max_factor).each_with_index do |val1, ind1|
      (@min_factor..@max_factor).to_a[ind1..-1].each do |val2|
        next unless palindromic?(val1 * val2)
        @results[val1 * val2] ||= []
        @results[val1 * val2] << [val1, val2]
      end
    end
  end

  def largest
    key = @results.keys.max
    Node.new(key, @results[key])
  end

  def smallest
    key = @results.keys.min
    Node.new(key, @results[key])
  end

  private

  Node = Struct.new(:value, :factors)
  private_constant :Node

  def palindromic?(num)
    num.to_s.reverse.to_i == num
  end
end
