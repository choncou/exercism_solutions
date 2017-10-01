class Atbash
  # Build encoding map
  ENCODING_MAP = ('a'..'z')
                 .zip(('a'..'z').to_a.reverse)
                 .each_with_object({}) { |val, memo| memo[val.first] = val.last }.freeze

  def self.encode(string)
    encoded = string.downcase.chars
                    .select { |char| ('a'..'z').to_a.concat(('0'..'9').to_a).include?(char) }
                    .map { |char| ENCODING_MAP[char] || char }

    [].tap do |result|
      result << encoded.shift(5) until encoded.empty?
    end.map(&:join).join(' ')
  end
end
