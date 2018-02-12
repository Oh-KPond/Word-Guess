class Word
  def initialize(words_array)
    @words_array = words_array
  end

  def random_word
    @random_word = @words_array.sample
    return random_word
  end
  
  def split
    @letters_array = @random_word.split(//)
    return letters_array
  end

end

class Letter
  def initialize(argument)
    @argument = argument
  end
end

class Art
  def initialize(argument)
    @argument = argument
  end
end
