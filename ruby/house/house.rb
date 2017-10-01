class House
  PHRASES = [
    'the house that Jack built.', "the malt\nthat lay in", "the rat\nthat ate",
    "the cat\nthat killed", "the dog\nthat worried", "the cow with the crumpled horn\nthat tossed",
    "the maiden all forlorn\nthat milked", "the man all tattered and torn\nthat kissed",
    "the priest all shaven and shorn\nthat married", "the rooster that crowed in the morn\nthat woke",
    "the farmer sowing his corn\nthat kept", "the horse and the hound and the horn\nthat belonged to"
  ].freeze

  def self.recite
    create_recital.map { |paragraph| paragraph.join(' ') }.join("\n\n") << "\n"
  end

  def self.create_recital(result = [], pos = 0)
    return result if pos == PHRASES.size

    lines = PHRASES[0..pos].reverse
    result << [].tap do |paragraph|
      paragraph << "This is #{lines.shift}"
      paragraph << lines.shift until lines.empty?
    end

    create_recital(result, pos + 1)
  end
  private_class_method :create_recital
end
