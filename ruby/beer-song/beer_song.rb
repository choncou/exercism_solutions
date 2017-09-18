class BeerSong
  def verse(num)
    if num == 0
      return <<~TEXT
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
      TEXT
    end

    pronoun = num == 1 ? 'it' : 'one'
    <<~TEXT
      #{collective(num)} of beer on the wall, #{collective(num)} of beer.
      Take #{pronoun} down and pass it around, #{collective(num-1)} of beer on the wall.
      TEXT
  end

  def verses(from, to)
    from.downto(to).map { |num| verse(num) }.join("\n")
  end

  private

  def collective(num)
    ['no more bottles', '1 bottle'][num] || "#{num} bottles"
  end
end

module BookKeeping
  VERSION = 3
end
