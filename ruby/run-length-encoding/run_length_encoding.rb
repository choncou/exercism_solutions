class RunLengthEncoding
  def self.encode(data)
    return '' if data.empty?
    count = [0]

    chars = data.split('').reduce([data[0]]) do |memo, value|
      memo.last == value ? count[-1] += 1 : count << 1

      memo.last == value ? memo : memo << value
    end

    output = ''
    count.zip(chars) do |arr|
      output << (arr[0] == 1 ? arr[1] : arr.join).to_s
    end
    output
  end

  def self.decode(data)
    count = data.split(/\D/).delete_if(&:empty?).map(&:to_i)
    return data if count.empty?

    offset = 0
    # go through the characters and ensure that each one has a count
    chars = data.split(/\d/).delete_if(&:empty?).map.with_index do |group, i|
      fix = true # does the offset need to be used when fixing the count
      group[1..-1].split('').each_with_index do |char, index|
        fix ? count.insert(i+index+offset+1, 1) : count.insert(i+index+offset, 1)
        offset += 1
        fix = false
      end
      group.split('') 
    end.flatten

    output = ''
    count.each_with_index do |c, index|
      output << chars[index]*c
    end
    output
  end
end

module BookKeeping
 VERSION = 3
end
