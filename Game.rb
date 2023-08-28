class Game
  attr_accessor :word, :letters_guessed, :guesses_left, :gameover, :gamewon, :message
  # Initialize the game
  def initialize(word)
    @word = word
    @letters_guessed = []
    @wrong_letters = []
    @guesses_left = 6
    @gameover = false
    @gamewon = false
    @message = "Guess a letter"
  end

  def guess(letter)
    if letter.length > 1
      @message = "Please guess one letter at a time"
      return
    end
    if letters_guessed.include?(letter) || @wrong_letters.include?(letter)
      @message =  "You already guessed that letter"
      return
    end
    if @word.include?(letter)
      @letters_guessed << letter
      @message = "Guess a letter"
    else
      @guesses_left -= 1
      @wrong_letters << letter
      @message = "Guess a letter"
    end
  end

  def is_game_over
    if @guesses_left == 0
      @gameover = true  
    end
  end

  def is_game_won
    if @word.split('').uniq.sort == @letters_guessed.sort
      @gamewon = true
    end
  end
end

#make a game class, define moves as methods
#make a player class count wins and player name
#make a board class to display the board
#make a main to run game