class SpaceAge
  PLANET_TO_EARTH_TIME = {
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze

  attr_reader :on_earth

  def initialize(seconds)
    @seconds = seconds
    @on_earth = seconds/31557600.0
  end

  PLANET_TO_EARTH_TIME.each do |name, multiplier|
    define_method("on_#{name}".to_sym) do
      @on_earth / multiplier
    end
  end
end

module BookKeeping
  VERSION = 1
end
