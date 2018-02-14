class Game
  attr_accessor :words_array, :word, :guess, :tries

  def initialize(words_array)
    @words_array = words_array
    @tries = 5
  end

  def choose_word
    @word = Word.new(words_array.sample)
  end

  ## Start Guess Method
  def guess(letters_array)
    art = Art.new
    bad_guesses = []
    while @tries > 0 && word.blanks_array.include?("_")
      puts art.play_art
      puts "\t#{word.blanks_array.join(" ")}"
      print "\nPlease guess a letter: "
      guess = gets.chomp
      puts "\n------------------------------------------"


      if word.letters_array.include?(guess) # if guess is right
        puts "Good guess!"
        # finding blanks and replacing them with the guess
        word.letters_array.length.times do |i|
          if word.letters_array[i] == guess
            word.blanks_array[i] = guess
          end
        end
      else # if guess is wrong
        @tries -= 1
        puts "\nSorry try again."
        puts "You have #{@tries} left."
        bad_guesses << guess
      end
      if bad_guesses.length != 0
        puts "\nAlready guessed letters are: \n#{bad_guesses.join(", ")}\n"
      end

    end
    return @tries
  end
  ## End Guess Method
end

## Start Word Class
class Word
  attr_accessor :blanks_array, :chosen_word, :letters_array

  def initialize(word)
    @chosen_word = word
  end

  def split
    @letters_array = @chosen_word.split(//)
    return @letters_array
  end

  def create_blanks
    @blanks_array = []
    @letters_array.each do
      @blanks_array << "_"
    end
    return @blanks_array
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
    @play_art = "

Z Z Z Z Z

  |\\      _,,,---,,_
  /,`.-'`'    -.  ;-;;,_
  |,4-  ) )-,_..;\\ (  `'-'
  '---''(_/--'  `-'\\_)"

      return @play_art
    end

    def end_art
      @end_art = "
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

        return @end_art
      end
    end
    ## End Art Class

    ## Start Game
    game = Game.new(["ampers","octos","code","ada"])

    puts "\nWelcome to our Don't Wake the Cat Guessing Game!"
    puts "Can you guess my word before the cat wakes up?"
    game.choose_word # => word from array
    game.word.split  # word split
    puts "The word is #{game.word.split.length} letters long."
    game.word.create_blanks
    game.guess(game.word)
    if game.tries == 0 # ran out of tries
      puts "\nSorry the cat is now awake"
      our_art = Art.new
      puts our_art.end_art
    else # if word correct
      puts "\nCongratulations you've guessed the word! You win!\n"
    end
