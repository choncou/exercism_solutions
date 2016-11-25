class Hamming
  def self.compute(strand_1, strand_2)
    return 0 if strand_1 == strand_2
    raise ArgumentError if strand_1.length != strand_2.length

    strand_1.chars.map.with_index(0) { |x, i| x == strand_2[i] }.count(false)
  end
end

module BookKeeping
  VERSION = 3
end