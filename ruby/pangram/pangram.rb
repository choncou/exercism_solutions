class Pangram
  def self.is_pangram?(sentence)
    downcased = sentence.downcase
    ('a'..'z').all? { |x| downcased.include?(x) }
  end
end

module BookKeeping
  VERSION = 2
end