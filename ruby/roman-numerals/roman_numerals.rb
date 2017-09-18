class Integer
  ROMAN_MAP = { 
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def to_roman
    value = self
    ROMAN_MAP.keys.reduce('') do |memo, key|
      times, value = value.divmod(key)
      memo << (ROMAN_MAP[key] * times)
    end
  end
end

module BookKeeping
  VERSION = 2
end
