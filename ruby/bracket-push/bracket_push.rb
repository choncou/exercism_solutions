class Brackets
  PARENTHESIS_MAPPER = { '{' => '}', '(' => ')', '[' => ']'}
  private_constant :PARENTHESIS_MAPPER

  def self.paired?(string)
    expected = []
    string.each_char do |char|
      if PARENTHESIS_MAPPER[char]
        expected << PARENTHESIS_MAPPER[char] 
      else
        return false if ']})'.include?(char) && expected.pop != char  
      end
    end

    expected.empty?
  end
end

module BookKeeping
  VERSION = 4
end
