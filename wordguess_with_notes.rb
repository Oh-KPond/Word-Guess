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
  attr_accessor :blanks, :word, :letters_array

  def initialize(word)
    @word = word
  end

  def split
    # @letters_array = @word
    @letters_array = @word.split(//)
    return @letters_array
  end

  def create_blanks
    blanks = ""
    @letters_array.each do
      blanks += "_ "
    end
    return blanks
  end
end

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

def guess(game_word)
  puts "I'm in the guess method. I passed in an instance of Word called my_word_instance. This is its value:"
  puts game_word

  # start guess loop
  print "Please guess a letter: "
  guess = gets.chomp

  puts "I want some letters_array. What is the letters array?"
  puts game_word.letters_array

  if game_word.letters_array.include?(guess) # if guess is right
    puts "Good guess!"
  else # if guess is wrong
    # change art
    puts "Sorry try again"
  end
end

game = Game.new(["ampers","octos","code","ada"])

our_art = Art.new
print our_art.play_art

puts "\nWelcome to our Don't Wake the Cat Guessing Game!"
puts "Can you guess my word before the cat wakes up?"
game.choose_word
p game.word.split
p game.word.create_blanks
# add art

puts "I have an instance of Game:"
puts game
puts "My instance of Game called game has an instance of word in game.word"
puts game.word

guess(game.word)
# if word correct
puts "Congratulations you won!"
# if word incorrect
puts "Sorry the cat is now awake"
puts our_art.end_art
