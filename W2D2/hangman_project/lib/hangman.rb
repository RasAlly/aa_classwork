class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end
  
  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
  indices = []
    @secret_word.each_char.with_index do |ele, i|
      if char == ele
      indices << i
      end
    end
    indices
  end

  def fill_indices(char, arr)
    arr.each do |n|
      @guess_word[n] = char
    end
  end

  def try_guess(char)
    arr = get_matching_indices(char)
    fill_indices(char, arr)
    if !@secret_word.include?(char)
      @remaining_incorrect_guesses -= 1
    end
    if already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp
    try_guess(char)
  end

  def win?
    @guess_word.each do |ele|
      if !@secret_word.include?(ele)
        return false
      end
    end
    p "WIN"
    true
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end
end
