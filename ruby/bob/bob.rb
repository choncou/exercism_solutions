class Bob
  def self.hey(remark)
    remark.strip!

    case remark[-1]
    when '?'
      if ('A'..'Z').include?(remark[-2]) && ('A'..'Z').include?(remark[1])
        return 'Whoa, chill out!'
      else
        return 'Sure.'
      end
    when '!'
      if [*'A'..'Z', *'0'..'9'].include?(remark[-2])
        return 'Whoa, chill out!'
      end
    when 'A'..'Z'
      return 'Whoa, chill out!'
    when nil
      return 'Fine. Be that way!'
    end

    'Whatever.'
  end
end

module BookKeeping
  VERSION = 1
end
