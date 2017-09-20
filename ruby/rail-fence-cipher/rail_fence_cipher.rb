class RailFenceCipher
  VERSION = 1

  def self.encode(data, rails)
    return data if rails == 1

    @chars = data.chars
    @encoded_table = []
    rails.times { @encoded_table << Array.new(2) }

    current = -1
    while @chars.size > 0
      0.upto(rails-2).each do |row|
        current += 1
        @encoded_table[row][current] = @chars.shift
      end
      (rails-1).downto(1).each do |row|
        current += 1
        @encoded_table[row][current] = @chars.shift
      end
    end

    @encoded_table.join
  end

  def self.decode(encoded, rails)
    return encoded if rails == 1 || encoded == ''

    cycle = (rails*2)-2

    @chars = encoded.chars
    units = @chars.size/cycle
    @encoded_table = [].tap do |x|
      rails.times { x << Array.new(units * cycle + (@chars.size % units)) }
    end

    # insert encoded chars into the table/puzzle
    prev = nil
    @encoded_table.map!.with_index do |row, rail|
      if rail > 0
        prev.each_with_index do |val, index|
          next unless val
          if rail == 1
            row[index - 1] = @chars.shift unless row[index - 1] || index == 0
          end
          row[index+rail] = @chars.shift unless row[index+rail] || index == row.size-rail
        end
      else
        col = 0
        until col > row.size
          row[col] = @chars.shift
          col += cycle
        end
      end
      prev = row if rail == 0
      row
    end

    # read through the puzzle to decode
    current = -1
    while @chars.size <= encoded.size
      0.upto(rails-2).each do |row|
        current += 1
        @chars << @encoded_table[row][current]
      end
      (rails-1).downto(1).each do |row|
        current += 1
        @chars << @encoded_table[row][current]
      end
    end

    @chars.join
  end
end
