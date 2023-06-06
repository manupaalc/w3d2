class Card
    def initialize(face_value)
        @face_value = face_value
        @face_up = false   
    end

    attr_reader :face_value, :face_up
    
    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s
        @face_up ? @face_value : " "
    end

    def ==(another_card)
        @face_value == another_card.face_value
    end
end