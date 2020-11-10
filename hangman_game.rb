# frozen_string_literal: true

class Hangman
  def initialize
    @word = words.sample
    @lives = 7
    @word_teaser = ''
    @word.first.size.times { @word_teaser += '_ ' }
  end

  def words
    [
      ['cricket', 'A game played by gentlemen'],
      ['jogging', 'We are not walking...'],
      ['celebrate', 'Remembering special moments'],
      ['continent', 'There are seven of these'],
      ['exotic', 'Not from around here...']
    ]
  end

  def print_teaser(last_guess = nil)
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser(last_guess)
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |char, ind|
      new_teaser[ind] = last_guess if char == '_' && @word.first[ind] == last_guess
    end

    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives.positive?
      puts 'Enter a letter'
      guess = gets.chomp
      good_guess = @word.first.include?(guess)

      if guess == 'exit'
        puts 'Thank you for playing!'
      elsif good_guess
        puts 'You are correct!'
        print_teaser(guess)
        if @word.first == @word_teaser.split.join
          puts 'Congratulations... you have won ths round!'
        else
          make_guess
        end
      else
        @lives -= 1
        puts "Sorry... you have #{@lives} guesses left. Try again!"
        make_guess
      end
    else
      puts 'Game over... Better luck next time'
    end
  end

  def begin
    puts "New game started... your word is #{@word.first.size} characters long."
    puts "To exit the game at any point type 'exit'"
    print_teaser
    puts "Clue => #{@word.last}"
    make_guess
  end
end

game = Hangman.new
game.begin
