require_relative "card.rb"
require_relative "board.rb"

class Game
    def initialize(size)
        if size.even?
            @board = Board.new(size)
        else
            raise "Size must be an even number."
        end
        
        @board.populate
    end

    attr_reader :board

    def play
        until @board.won?
            system("clear")
            @board.render
            
            puts "Enter a position with coordinates in the format [row, column] separated with a space like '1 2': "
            first_guess = gets.chomp.split(" ").map(&:to_i)
            raise "Invalid position" if first_guess.length > 2 || (0...@board.grid.length).include?([first_guess[0]]) || (0...@board.grid.length).include?([first_guess[0]])
            @board.grid[first_guess[0]][first_guess[1]].reveal
            @board.render
            
            puts "Enter another position with coordinates in the format [row, column] separated with a space like '1 2': "
            second_guess = gets.chomp.split(" ").map(&:to_i)
            raise "Invalid position" if second_guess.length > 2 || (0...@board.grid.length).include?([second_guess[1]]) || (0...@board.grid.length).include?([second_guess[1]])
            @board.grid[second_guess[0]][second_guess[1]].reveal
            @board.render
            sleep(3)

            unless @board.grid[second_guess[0]][second_guess[1]].face_value == @board.grid[first_guess[0]][first_guess[1]].face_value
                @board.grid[first_guess[0]][first_guess[1]].hide
                @board.grid[second_guess[0]][second_guess[1]].hide
            else
                puts "Those cards match."
            end
        end

        puts "You win!"
    end
end