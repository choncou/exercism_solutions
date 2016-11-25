class Gigasecond
  def self.from(date)
    gigasecond_later = date.to_i + 1_000_000_000
    Time.at(gigasecond_later).utc
  end
end

module BookKeeping 
  VERSION = 5
end