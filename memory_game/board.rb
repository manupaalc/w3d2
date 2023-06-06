require_relative "card.rb"
require "byebug"

class Board
    def initialize(size)
        @board = Array.new(size) { Array.new(size) }
        @size = size
    end

    attr_reader :size

    def all_board_positions
        board_positions = []

        (0...@size).each do |i|
            (0...@size).each do |j|
                board_positions << [i, j]
            end
        end

        board_positions
    end

    
    def populate
        board_positions = self.all_board_positions
        
        (size * size / 2).times do
            random_position_1 = board_positions.sample
            board_positions.delete(random_position_1)
            random_position_2 = board_positions.sample
            board_positions.delete(random_position_2)

            temp = ("A".."Z").to_a.sample

            @board[random_position_1[0]][random_position_1[1]] = Card.new(temp)
            @board[random_position_2[0]][random_position_2[1]] = Card.new(temp)
        end
    end
    def render
        print "  "
        @board.each_with_index {|ele, i| print i.to_s + " "}
        puts "\n"
        @board.each_with_index do |row, i| 
            puts i.to_s + " " + row.join(" ")
        end

    end


    
end

board = Board.new(4)
board.populate