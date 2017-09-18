class Binary
  def self.to_decimal(binary)
    binary.reverse.chars.map.with_index do |x, i|
      throw ArgumentError.new unless ['0','1'].include?(x)
      x.to_i * (2**i) 
    end.reduce(&:+)
  end
end

module BookKeeping
  VERSION = 3
end
