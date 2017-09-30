class FlattenArray
  VERSION = 1

  def self.flatten(array, outer=[])
    array.map do |item|
      item.is_a?(Array) ? self.flatten(item, outer) : outer << item
    end
    outer.select { |x| x }
  end
end
