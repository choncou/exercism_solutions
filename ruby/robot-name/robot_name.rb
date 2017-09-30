class Robot
  @@available_names = ('AA000'..'ZZ999').to_a.shuffle

  attr_reader :name

  def self.forget
    @@available_names = ('AA000'..'ZZ999').to_a.shuffle
  end

  def initialize
    reset
  end

  def reset
    @name = @@available_names.pop
  end
end

module BookKeeping
  VERSION = 3
end
