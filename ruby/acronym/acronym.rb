class Acronym
  def self.abbreviate(input)
    words = input.scan(/[A-z]+/)
    words.map { |word| word[0].upcase }.join
  end
end

module BookKeeping
  VERSION = 4
end
