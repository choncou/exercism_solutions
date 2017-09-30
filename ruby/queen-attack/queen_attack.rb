class Queens
  def initialize(white: white=nil, black: black=nil)
    raise ArgumentError.new unless on_board?(white) if white
    raise ArgumentError.new unless on_board?(black) if black
    @board ||= Array.new(8) { Array.new(8) }
    @white = white
    @black = black

    mark_straights
    mark_diagonals
  end

  def attack?
    @board[@black.first][@black.last]
  end

  private

  def on_board?(pos)
    pos.all? { |x| (0..7).include?(x) }
  end

  def mark_straights
    @board.map!.with_index do |y, y_index|
      y.map!.with_index do |x, x_index|
        y_index == @white[0] || x_index == @white[1]
      end
    end
  end

  def mark_diagonals
    # move up-left
    y, x = @white
    until x < 0 || y < 0
      @board[y][x] = true
      y -= 1
      x -= 1
    end

    # move up-right
    y, x = @white
    until x < 0 || y > 7
      @board[y][x] = true
      y += 1
      x -= 1
    end

    # move down-left
    y, x = @white
    until x > 7 || y < 0
      @board[y][x] = true
      y -= 1
      x += 1
    end

    # move down-right
    y, x = @white
    until x > 7 || y > 7
      @board[y][x] = true
      y += 1
      x += 1
    end
  end
end

module BookKeeping
  VERSION = 2
end
