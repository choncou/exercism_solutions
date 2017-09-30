class Scrabble
  def initialize(word)
    @word = word ? word.strip : ''
  end

  def score
    @word.chars.reduce(0) { |memo, char| memo + LETTER_SCORE_MAP[char.upcase] }
  end

  def self.score(word)
    new(word).score
  end

  private

  LETTER_SCORE_MAP = {}.tap do |hash|
    %w[A E I O U L N R S T].each { |x| hash[x] = 1 }
    %w[D G].each { |x| hash[x] = 2 }
    %w[B C M P].each { |x| hash[x] = 3 }
    %w[F H V W Y].each { |x| hash[x] = 4 }
    %w[K].each { |x| hash[x] = 5 }
    %w[J X].each { |x| hash[x] = 8 }
    %w[Q Z].each { |x| hash[x] = 10 }
  end

end
