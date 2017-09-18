class Anagram
  def initialize(word)
    @base_word = word.downcase
    @base_count = char_counter(word)
  end

  def match(words)
    # work with a duplicate so that the sender's object is not tampered with
    words.dup.tap do |x|
      x.select! { |word| char_counter(word) == @base_count }
      x.reject! { |word| word.downcase == @base_word }
    end
  end

  private

  def char_counter(word)
    word.chars.each_with_object(Hash.new(0)) do |char, memo|
      memo[char.downcase] += 1
    end
  end
end

class BookKeeping
  VERSION = 2
end
