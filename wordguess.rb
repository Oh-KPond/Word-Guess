require "awesome_print"

class Game
  attr_accessor :words_array, :word, :guess

  def initialize(words_array)
    @words_array = words_array
    @tries = 5
  end

  def choose_word
    @word = Word.new(words_array.sample)
  end

  ## Start Guess Method
  def guess(letters_array)
    print "Please guess a letter: "
    guess = gets.chomp

    if word.letters_array.include?(guess) # if guess is right
      puts "Good guess!"
    else # if guess is wrong
      @tries -= 1
      # change art
      puts "Sorry try again."
      puts "You have #{@tries} left."
    end
  end
  ## End Guess Method
end

## Start Word Class
class Word
  attr_accessor :blanks, :chosen_word, :letters_array

  def initialize(word)
    @chosen_word = word
  end

  def split
    @letters_array = @chosen_word.split(//)
    return @letters_array
  end

  def create_blanks
    blanks = "     "
    @letters_array.each do
      blanks += "_ "
    end
    return blanks
  end
end
## End Word Class

## Start Art Class
class Art
  attr_accessor :art

  def initialize
    @art = art
  end

  def play_art
    play_art = "
      |\\    _,,,---,,_
      /,`.-'`'    -.  ;-;;,_
      |,4-  ) )-,_..;\\(  `'-'
      '---''(_/--'  `-'\\_)"
    return play_art
  end

  def end_art
  end_art = "
                         _
                        | \\
                        | |
                        | |
   |\\                   | |
  /, ~\\                / /
 X     `-.....-------./ /
  ~-. ~  ~              |
     \\             /    |
      \\  /_     ___\\   /
      | /\\ ~~~~~   \\ |
      | | \\        || |
      | |\\ \\       || )
     (_/ (_/      ((_/"
  return end_art
  end
end
## End Art Class

## Start Game
game = Game.new(["ampers","octos","code","ada"])

our_art = Art.new
print our_art.play_art

puts "\nWelcome to our Don't Wake the Cat Guessing Game!"
puts "Can you guess my word before the cat wakes up?"
game.choose_word # => word from array
game.word.split
puts "The word is #{game.word.split.length} letters long."
puts game.word.create_blanks
# while word not guessed || tries exahaused
game.guess(game.word)
# end
# if word correct
# puts "Congratulations you won!"
# if word incorrect
# puts "Sorry the cat is now awake"
# puts our_art.end_art


# Welcome to the game
# Take a guess
# If guess is incorrect
#   take away "Z"
#   subtract 1 from tries
#   tell user "not included in word"
# If not out of tries or word not guessed
# Print image again
#   list letters guessed incorrectly
# Ask for guess
# If guess correct
#   replace blanks with letters
# If not out of tries or word not guessed
# Print image again
# Ask for guess
