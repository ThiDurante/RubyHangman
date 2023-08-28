require_relative './Board.rb'
require_relative './Player.rb'
require_relative './Game.rb'
require_relative './Words.rb'

class Main
  def initialize
  system "cls"
  puts "Welcome to Hangman!"
  print "What is your name?  "
  name = gets.chomp
  @player1 = Player.new(name)
  @board = Board.new
  @game_running = true
  end

  def round
    puts @game.message
    letter = gets.chomp
    @game.guess(letter)
    @game.is_game_over
    @game.is_game_won
  end

  def game_loop
    while @game.gameover == false and @game.gamewon == false
      @board.show_board(@game.guesses_left)
      @board.show_word(@game.word, @game.letters_guessed)
      round()
    end
    if @game.gamewon == true
      puts "Congrats, You guessed the word!"
      puts "The word was #{@game.word}"
      @player1.win
      after_game()
    end
    if @game.gameover == true
      @board.show_board(@game.guesses_left)
      @board.show_word(@game.word, @game.letters_guessed)
      puts "Sorry, You got hanged!"
      puts "The word was #{@game.word}"
      after_game()
    end
  end

  def play
    puts "Start a new game? (y/n)"
    answer = gets.chomp
    system "cls"
    if answer == "y"
      @game = Game.new(WORDS.sample)
      game_loop()
    else
      puts "Thanks for playing!"
      @game_running = false
    end
  end

  def after_game
    puts "#{@player1.name} you have won #{@player1.wins} games"
    puts "Would you like to play again? (y/n)"
    answer = gets.chomp
    if answer == "y"
      @game = Game.new(WORDS.sample)
      game_loop()
    else
      puts "Thanks for playing!"
      @game_running = false
    end
  end
end

hangman = Main.new
hangman.play



