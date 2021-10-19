require_relative 'board'
require_relative 'card'

class Game
    
    def initialize(n)
        @board = Board.new(n)
        @board.populate
        @previous_pos = nil
    end


    def play_loop
        puts 'Enter a position separated by a comma ie 0,1'
        pos = gets.chomp.split(',').map(&:to_i)
        make_guess(pos)
    end

    def make_guess(pos)
        if @previous_pos == nil
            @previous_pos = pos
        end
        @board.reveal(pos)
    end

end