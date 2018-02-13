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

def guess
  # start guess loop
  print "Please guess a letter: "
  guess = gets.chomp
  # if guess is wrong
  # change art
  puts "Sorry try again"
  # if guess is right
  puts "Good guess!"
  # end guess loop
end

puts "\nWelcome to our Don't Wake the Cat Guessing Game!"
puts "Can you guess my word before the cat wakes up?"
# add art

# if word correct
puts "Congratulations you won!"
# if word incorrect
puts "Sorry the cat is now awake"
