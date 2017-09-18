class PrimeFactors
  def self.for(num)
    result = []
    current_div = 2
    current_num = num

    until current_num == 1
      new_num, rem = current_num.divmod(current_div)
      if rem == 0
        current_num = new_num
        result << current_div
      else
        current_div += 1
      end
    end
    result
  end
end

