class Complement
  COMPLEMENTS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }.freeze

  def self.of_dna(dna)
    result =  dna.chars.map { |x| COMPLEMENTS.fetch(x, false) }
    result.include?(false) ? '' : result.join
  end
end

module BookKeeping
  VERSION = 4
end