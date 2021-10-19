class Card
    def initialize(face_value)
        @face_value = face_value
        @hidden = true
        # @found = false
    end

    def hidden
        @hidden
    end

    def hidden=(val)
        @hidden = val
    end

    # def display
    #     if !@hidden
    #         return @face_value 
    #     else
    #         return "X"
    #     end
    # end

    def hide
        return "X"
    end

    def reveal
        return @face_value
    end





end