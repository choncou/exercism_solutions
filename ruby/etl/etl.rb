class ETL
  def self.transform(old)
    old.reduce({}) do |memo, (score, letters)|
      letters.each { |letter| memo[letter.downcase] = score }
      memo
    end
  end
end

module BookKeeping
  VERSION = 1
end
