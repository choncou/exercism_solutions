class Alphametics
  def self.solve(input)
    @letters = input.scan(/[A-Z]/).uniq
    sum, @result = input.split(' == ')
    @sum_numbers = sum.split(' + ')
    @leading_chars = (@sum_numbers.map { |x| x[0] } << @result[0]).uniq

    @char_map = @letters.each_with_object({}) do |char, memo|
      memo[char] = 0
    end

    (0..9).to_a.permutation(@letters.size).each do |perm|
      # set new possible values for each character
      @char_map.each { |key, value| @char_map[key] = perm.shift }
      # skip iteration if a leading character is set to 0
      next if invalid_leading_char
      return @char_map if check
    end

    {}
  end

  private

  def self.invalid_leading_char
    @char_map.any? { |key, val| @leading_chars.include?(key) && val == 0 }
  end

  def self.check
    check_sum = @sum_numbers.map do |number|
      number.gsub(/[A-Z]/) { |char| @char_map[char] }.to_i
    end.reduce(:+)

    check_result = @result.gsub(/[A-Z]/) { |char| @char_map[char] }.to_i

    check_sum == check_result
  end
end

module BookKeeping
  VERSION = 4
end
