class Card
    def initialize(face_value, hidden)
        @face_value = face_value
        @hidden = true
    end

    def dispaly
        if !@hidden
            return @face_value 
        else
            return " "
        end
    end

    def hide
        return " "
    end

    def reveal
        return @face_value
    end

    



end