class Nucleotide
  def self.from_dna(dna)
    new(dna)
  end

  def initialize(dna)
    raise ArgumentError.new unless dna.chars.all? { |char| %w[A T C G].include?(char) }

    @dna = dna
    @histogram = {}
    %w[A T C G].each { |x| @histogram[x] = 0 }
  end

  def count(letter)
    @dna.count(letter)
  end

  def histogram
    @dna.chars.each { |x| @histogram[x] += 1 }
    @histogram
  end
end
