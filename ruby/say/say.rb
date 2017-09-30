class Say
  def initialize(number)
    raise ArgumentError.new unless (0...1_000_000_000_000).include?(number)

    @number = number
    @thousands = [].tap do |arr|
      chars = @number.to_s.chars
      arr.unshift(chars.pop(3).map(&:to_i)) until chars.size == 0
    end
  end

  def in_english(nums=@thousands.dup, sentence=[])
    if nums.size == 0
      sentence.select!(&:itself)
      return sentence.join(' ')
    end

    term = nums.size - 1 # To determine what value INCREMENT_TERM to use
    num = nums.shift.join.to_i
    if num < 100
      sentence << get_under_99(num) unless num == 0 && @thousands.size > 1
    else
      hundreds, remainder = num.divmod(100)
      hundred_sentence = NUMBER_WORD_MAP[hundreds] + " hundred"
      sentence << hundred_sentence
      sentence << get_under_99(remainder) unless remainder == 0
    end
    sentence << INCREMENT_TERMS[term] unless num == 0
    in_english(nums, sentence)
  end

  private

  def get_under_99(num)
    return NUMBER_WORD_MAP[num] if NUMBER_WORD_MAP[num]

    num.to_s.reverse.chars.map.with_index do |char, index|
      number = char.to_i*(index > 0 ? index*10 : 1)
      NUMBER_WORD_MAP[number]
    end.reverse.join('-')
  end

  # Prepare Number-word conversion map
  NUMBER_WORD_MAP = %w[
zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen
fifteen sixteen seventeen eighteen nineteen twenty
  ].each_with_object({}) { |val, memo| memo[memo.size] = val }

  %w[
  thirty forty fifty sixty seventy eighty ninety
  ].each_with_index { |val, index| NUMBER_WORD_MAP[(index+3)*10] = val }

  INCREMENT_TERMS = [nil, 'thousand', 'million', 'billion']
end

module BookKeeping
  VERSION = 1
end
