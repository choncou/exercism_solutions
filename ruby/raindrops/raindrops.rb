class Raindrops
  def self.convert(drops)
    result = ''

    result << 'Pling' if drops % 3 == 0
    result << 'Plang' if drops % 5 == 0
    result << 'Plong' if drops % 7 == 0

    result.empty? ? drops.to_s : result 
  end
end

module BookKeeping
  VERSION = 3
end