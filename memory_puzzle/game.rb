require_relative 'board'
require_relative 'card'
require 'byebug'

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
            @board.render
        end
        puts "Victory!"
    end

    def make_guess(pos)
        # debugger
        if @guessed.include?(pos) || @guessed.include?(@previous_pos)
            return puts "already guessed"
        end
        if @previous_pos == nil 
            # @board[pos].reveal
            @board.reveal(pos)
            @previous_pos = pos #[0,0]
        # elsif @previous_pos == pos
        #     return 
        elsif (@board[pos].reveal == @board[@previous_pos].reveal) 
            @board[pos].hidden = false
            @board[@previous_pos].hidden = false
            @guessed << pos
            @guessed << @previous_pos
            @previous_pos = nil
        else
            @board.reveal(pos)
            @board[pos].hidden = false
            @board[@previous_pos].hidden = true
            @previous_pos = pos
        end
        puts
        puts
 
    end

  
end