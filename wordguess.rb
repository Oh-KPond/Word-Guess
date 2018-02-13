class Game
  attr_accessor :words_array, :word

  def initialize(words_array)
    @words_array = words_array
  end

  def choose_word
    @word = Word.new(words_array.sample)
  end

end

class Word
  def initialize(word)
    @word = word
  end

  def split
    # @letters_array = @word
    @letters_array = @word.split(//)
    return @letters_array
  end

  def create_
    blanks = ""
    @letters_array.each do
      blanks += "_ "
    end
    return blanks
  end
end

class Letter
  def initialize(argument)
    @argument = argument
  end
end

class Art
  attr_accessor :art

  def initialize
    @art = art
  end

  def print_art
    print_art =
      "|\\    _,,,---,,_
      /,`.-'`'    -.  ;-;;,_
      |,4-  ) )-,_..;\\(  `'-'
      '---''(_/--'  `-'\\_)"
    return print_art
  end

end

def guess(word)
  # start guess loop
  print "Please guess a letter: "
  guess = gets.chomp

  if word.letters_array.include?(guess) # if guess is right
    puts "Good guess!"
  else # if guess is wrong
    # change art
    puts "Sorry try again"
  end
end

my_game = Game.new(["ampers","octos","code","ada"])

our_art = Art.new
print our_art.print_art

puts "\nWelcome to our Don't Wake the Cat Guessing Game!"
puts "Can you guess my word before the cat wakes up?"
p my_game.choose_word
p my_game.word.split
p my_game.word.create_
# add art
# guess(word)
# if word correct
puts "Congratulations you won!"
# if word incorrect
puts "Sorry the cat is now awake"
