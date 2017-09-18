class Series
  def initialize(series)
    @series = series
  end

  def slices(num)
    raise ArgumentError.new if num > @series.length

    result = []

    # iterate through all chars while keeping the latest *num* chars in the
    # memo like a buffer.
    @series.chars.reduce([]) do |memo, char|
      memo << char
      memo.shift if memo.length > num
      result << memo.join if memo.length == num
      memo
    end
    result
  end
end
