class FoodChain
  SUBJECTS_STORY = {
    'fly' => ["I don't know why she swallowed the fly. Perhaps she'll die."],
    'spider' => ['It wriggled and jiggled and tickled inside her.'],
    'bird' => [
      'How absurd to swallow a bird!',
      'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.'
    ],
    'cat' => ['Imagine that, to swallow a cat!'],
    'dog' => ['What a hog, to swallow a dog!'],
    'goat' => ['Just opened her throat and swallowed a goat!'],
    'cow' => ["I don't know how she swallowed a cow!"],
    'horse' => []
  }

  def self.song
    result = []
    index = 0
    prev_animal = ''

    SUBJECTS_STORY.each do |animal, stories|
      paragraph = []


      paragraph << "I know an old lady who swallowed a #{animal}."

      if animal == 'horse'
        paragraph <<  "She's dead, of course!"
        result << paragraph
        break
      end

      paragraph << stories.first
      unless index == 0
        paragraph << (stories[1] || "She swallowed the #{animal} to catch the #{prev_animal}.")
        paragraph << result[index - 1][(index == 1 ? 1 : 2)..-1]
      end
      index += 1
      prev_animal = animal
      result << paragraph
    end

    result.map { |par| par.join("\n") }.join("\n\n") << "\n"
  end
end

module BookKeeping
  VERSION = 2
end
