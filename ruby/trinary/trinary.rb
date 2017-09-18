class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    @trinary.reverse.chars.map.with_index do |val, index|
      return 0 unless ('0'..'2').include?(val)
      val.to_i * (3 ** index)
    end.reduce(:+)
  end
end

module BookKeeping
  VERSION = 1
end
