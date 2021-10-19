require_relative "card"
require 'byebug'

class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n)}
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos,val)
        @grid[pos[0]][pos[1]] = val
    end

    def empty_positions?
        @grid.each do |arr|
            arr.each do |ele|
                if ele == nil
                    return true
                end
            end
        end
        false
    end

    def populate
        alphabet = ("a".."z").to_a
        hash = Hash.new(0)
        a_idx = 0
        while empty_positions?
            # debugger
            row = rand(@grid.length)
            col = rand(@grid.length)
            pos = [row, col]
            if self[pos] == nil
                val = alphabet[a_idx]
                self[pos] = Card.new(val)
                hash[alphabet[a_idx]] += 1
                if hash[alphabet[a_idx]] == 2
                    a_idx += 1
                end
            end
        end
        @grid
    end

    def render
        printed = @grid.map do |array|
            array.map do |ele| 
                if ele.hidden == true
                    ele.hide
                else
                    ele.reveal
                end
            end
        end
        printed.each do |row|
            puts row.join(" ")
        end
    end
end

# b = Board.new(4)
# b.populate
# # b.render