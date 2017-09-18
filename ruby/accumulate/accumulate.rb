class Array
  def accumulate(&block)
    result = []
    result.tap do
      each do |e|
        result << block.call(e)
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
