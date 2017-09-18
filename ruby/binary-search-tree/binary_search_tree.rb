require 'forwardable'

class Bst
  extend Forwardable # to allow delegating function instead of declaring manually

  def_delegators :@root, :data, :left, :right, :insert

  def initialize(data)
     @root = Node.new(data)
  end

  # in-order(depth first) recursive traversal
  def each(current = @root, &block)
    return self.to_enum(:each) unless block_given?
    return if current.nil?

    each(current.left, &block)
    block.call(current.data)
    each(current.right, &block)
  end

  private

  class Node
    attr_reader :data
    attr_accessor :left, :right

    def initialize(data)
      @data = data
    end

    def insert(data)
      if data > @data
        @right ? @right.insert(data) : @right = Node.new(data)
      else
        @left ? @left.insert(data) : @left = Node.new(data)
      end
    end
  end
end

module BookKeeping
  VERSION = 1
end
