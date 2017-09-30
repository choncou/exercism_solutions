require 'date' 

class Meetup
  def initialize(month, year)
    @date = Date.new(year, month)
  end

  def day(day, schedule)
    @date += 1 until @date.send("#{day}?") unless schedule == :last

    case schedule
    when :second
      @date += 7
    when :third
      @date += 14
    when :fourth
      @date += 21
    when :teenth
      @date += 7 until (13..19).include?(@date.day)
    when :last
      year = @date.month == 12 ? @date.year + 1 : @date.year
      @date = Date.new(year, @date.month == 12 ? 1 : @date.month+1) - 1
      @date -= 1 until @date.send("#{day}?")
    end

    @date
  end
end

