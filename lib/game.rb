require 'io/console'
require_relative 'board'
require_relative 'output'

module LinkUpFour
  # Handles gameplay
  class Game
    attr_reader :current_player
    def initialize
      @board = Board.new
      @current_player = :black
    end

    def switch_player
      @current_player = @current_player == :black ? :red : :black
    end

    def clear
      system("clear") || system("cls")
    end

    def output(str)
      Output.new(str).output_one_line
    end

    def start_message
      blank_white
      puts output('Welcome to Link Up 4')
      puts output('Black goes first')
    end

    def turn_message
      puts output("It is #{@current_player}'s turn.")
      puts output("Choose a column, 1-#{COLS}.")
      puts output('Press Q to quit.')
      blank_white
    end

    def blank_white
      puts output('')
    end

    def start
      clear
      start_message
      turn_loop
    end

    def turn
      puts @board.to_s
      turn_message
      STDIN.getch
    end

    def column_full
      blank_white
      puts output('That column is full.')
      puts output('Try another column.')
    end

    def turn_loop
      loop do
        input = turn
        break if (input == 'Q' || input == 'q')
        if (input.to_i >= 1 && input.to_i <= COLS)
          column = input.to_i - 1
          success = @board.drop_checker column, @current_player
          if success
            switch_player
            clear
          else
            clear
            column_full
          end
        end
      end
    end
  end
end


