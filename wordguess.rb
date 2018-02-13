class Word
  attr_accessor :word, :letters_array

  def initialize(words_array)
    @word = words_array.sample
  end

  def split
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
  def initialize(argument)
    @argument = argument
  end
end

def guess(game_words)
  # start guess loop
  print "Please guess a letter: "
  guess = gets.chomp

  if game_words.letters_array.include?(guess) # if guess is right
    puts "Good guess!"
  else # if guess is wrong
    # change art
    puts "Sorry try again"
  end
end

game_words = Word.new(["ampers","octos","code","ada"])

p game_words.split
p game_words.create_



puts "\nWelcome to our Don't Wake the Cat Guessing Game!"
puts "Can you guess my word before the cat wakes up?"
# add art
guess(game_words)
# if word correct
puts "Congratulations you won!"
# if word incorrect
puts "Sorry the cat is now awake"
