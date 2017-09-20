class Crypto
  def initialize(message)
    @message = message
  end

  def normalize_plaintext
    @normalize_plaintext ||= @message.downcase.scan(/[a-z0-9]/).join
  end

  def size
    @size ||= Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    @plaintext_segments ||= normalize_plaintext.chars.each_with_object([[]]) do |char, memo|
      memo.last.size == size ? memo << [char] : memo.last << char
    end.map(&:join)
  end

  def ciphertext
    @ciphertext_array ||= plaintext_segments.map(&:chars).tap do |segments|
      segments.map! do |seg|
        seg << nil until seg.size == size
        seg
      end # end map! to make each segment the same size
    end.transpose

    @ciphertext_array.join
  end

  def normalize_ciphertext
    ciphertext
    @ciphertext_array.map(&:join).join(' ')
  end
end
