class Year
  def self.leap?(year)
    by_4 = year % 4 == 0
    by_100 = year % 100 == 0
    by_400 = year % 400 == 0

    by_4 && !by_100 || by_400 ? true : false
  end
end

module BookKeeping
  VERSION = 3
end
