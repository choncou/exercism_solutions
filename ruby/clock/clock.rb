class Clock
  attr_reader :hours, :minutes

  def self.at(hours, minutes)
    Clock.new(hours, minutes)
  end

  def initialize(hours, minutes)
    @hours, @minutes = hours, minutes
    update
  end


  def to_s
    "#{0 if @hours < 10}#{@hours}:#{0 if @minutes < 10}#{@minutes}"
  end

  def +(minutes)
    self.tap do
      @minutes += minutes
      update
    end
  end

  def ==(other)
    @hours == other.hours && @minutes == other.minutes
  end

  private

  def update
    until @minutes < 60 && @minutes >= 0
      diff = @minutes <=> 0
      @hours += diff
      @minutes -= 60 * diff
    end

    until @hours < 24 && @hours >= 0
      diff = @hours <=> 0
      @hours = @hours - (24 * diff)
    end
  end
end

module BookKeeping
  VERSION = 2
end
