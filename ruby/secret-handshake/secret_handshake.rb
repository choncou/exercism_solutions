class SecretHandshake
  ACTIONS = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(num)
    @num = num
  end

  def commands
    [].tap do |result|
      return result unless @num.is_a?(Integer)

      @num.to_s(2).chars.reverse_each.with_index do |item, index|
        result << ACTIONS[index] if item == '1'
      end

      result.reverse! if @num >= 16
    end.reject(&:nil?)
  end
end
