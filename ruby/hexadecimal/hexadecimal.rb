class Hexadecimal
  def initialize(hex)
    @hex = hex
  end

  def to_decimal
    @hex.reverse.chars.map.with_index do |char, index|
      num = ('0'..'9').include?(char) ? char.to_i : HEX_DECIMAL_MAP[char.upcase]
      return 0 if num.nil?
      num * (16 ** index)
    end.reduce(:+)
  end

  private

  HEX_DECIMAL_MAP = {
    'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
  }
end
