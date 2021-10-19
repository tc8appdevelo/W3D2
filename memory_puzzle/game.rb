require_relative 'board'
require_relative 'card'

class Game
    attr_writer :previous_pos
    def initialize(n)
        @board = Board.new(n)
        @board.populate
        @previous_pos = nil
        @guessed = []
    end

    # def @previous_pos=(val)
    #     @previous_pos=val
    # end

    def play_loop
        @board.render
        while !@board.won?
            puts 'Enter a position separated by a comma ie 0,1'
            pos = gets.chomp.split(',').map(&:to_i)
            make_guess(pos)
        end
        puts "Victory!"
    end

    def make_guess(pos)
        if @guessed.include?(pos)
            return puts "already guessed"
        end
        if @previous_pos == nil && 
            @board[pos].hidden = false
            @previous_pos = pos
        elsif (@board[pos].reveal == @board[@previous_pos].reveal) 
            @board[pos].hidden = false
            @guessed << pos
            @guessed << @previous_pos
            @previous_pos = nil
        elsif @guessed.include?(pos)
            @board[pos].hidden = false
        else
            @board.reveal(pos)
            @board[pos].hidden = true
            @board[@previous_pos].hidden = true
        end
        puts
        puts
        @board.render
        puts
        puts
    end

end