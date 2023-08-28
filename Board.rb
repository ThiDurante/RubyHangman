require_relative './ascii.rb'

class Board
  def show_board(guesses_left)
    puts HANGMAN_ASCII.reverse[guesses_left]
  end
  def show_word(word, letters_guessed)
    word.split('').each do |letter|
      if letters_guessed.include?(letter)
        print letter
      else
        print "_"
      end
    end
    puts
  end
end