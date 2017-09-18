module Sum
  refine Array do
    def sum
      reduce(:+)
    end
  end
end

using Sum

class Game
  def initialize
    @frames = [[]]
  end

  def roll(pins)
    raise BowlingError.new unless (0..10).include?(pins)
    if @frames.length == 10 && @frames.last.sum < 10 && !(@frames.last.length == 1)
      raise BowlingError.new
    end

    # add the latest roll to the last frame unless it has 2 rolls or a strike
    if @frames.last.length <= 1 && @frames.last[0] != 10
      raise BowlingError.new if (@frames.last << pins).sum > 10
    else
      @frames << [pins]
    end
  end

  def score
    raise BowlingError.new unless @frames.length >= 10

    @frames.take(10).map.with_index do |frame, index|
      frame_value(frame, index)
    end.sum
  end

  private

  def frame_value(frame, index)
    return frame.sum if frame.sum < 10 # open frame

    next_throw = @frames[index + 1][0]

    if frame == [10] # strike
      10 + next_throw + (@frames[index + 1][1] || @frames[index + 2][0])
    else # spare
      10 + next_throw
    end
    
  rescue NoMethodError # Will be raised when required bonus roll is missing (nil)
    raise BowlingError.new
  end
end

class Game::BowlingError < ArgumentError; end

module BookKeeping
  VERSION = 3
end
