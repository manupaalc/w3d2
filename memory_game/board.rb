require_relative "card.rb"

class Board
    def initialize(size)
        @grid = Array.new(size) { Array.new(size) }
        @size = size
    end

    attr_reader :size
    attr_accessor :grid

    def all_grid_positions
        grid_positions = []

        (0...@size).each do |i|
            (0...@size).each do |j|
                grid_positions << [i, j]
            end
        end

        grid_positions
    end

    
    def populate
        grid_positions = self.all_grid_positions
        
        (size * size / 2).times do
            random_position_1 = grid_positions.sample
            grid_positions.delete(random_position_1)
            random_position_2 = grid_positions.sample
            grid_positions.delete(random_position_2)

            temp = ("A".."Z").to_a.sample

            @grid[random_position_1[0]][random_position_1[1]] = Card.new(temp)
            @grid[random_position_2[0]][random_position_2[1]] = Card.new(temp)
        end
    end
    def render
        print "  "
        @grid.each_with_index {|ele, i| print i.to_s + " "}
        puts "\n"
        @grid.each_with_index do |row, i| 
            puts i.to_s + " " + row.join(" ")
        end
    end

    def won?
        @grid.all? do |row|
            row.all? { |card| card.face_up }
        end
    end

    def reveal(guessed_pos)
        unless @grid[guessed_pos[0]][guessed_pos[1]].face_up
            @grid[guessed_pos[0]][guessed_pos[1]].reveal
            @grid[guessed_pos[0]][guessed_pos[1]].face_value
        else
            puts "You have already flipped this card."
        end
    end          
end