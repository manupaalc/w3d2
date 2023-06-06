class Card
    

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
        
    end
    
    
    def hide
        @face_up = false
    end
    def reveal
        @face_up = true

    end
    def to_s
        face_value_string = @face_value.to_s
    end
    def ==(another_card)
        @face_value == another_card.face_value

    end

end