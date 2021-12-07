class Room
    attr_reader :capacity, :occupants
    def initialize(number)
        @capacity = number
        @occupants = []
    end
    def full?
        @occupants.length == @capacity
    end

    def available_space
        @capacity - @occupants.length
    end

    def add_occupant(str)
        if full?
            false
        else
            @occupants << str
            true
        end
    end
end
