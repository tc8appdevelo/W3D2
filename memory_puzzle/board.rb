require_relative "card"

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

    def populate
        alphabet = ("a".."z").to_a
        alpha_idx = 0
        @grid.each_with_index do |array, idx_1|
            array.each_with_index do |card, idx_2|
                row = rand(@grid.length)
                col = rand(@grid.length)
                pos = [row,col]
                if self[pos] == nil
                    self[pos] = alphabet[alpha_idx]
                    alpha_idx += 1
                end
            end
        end
    end
end