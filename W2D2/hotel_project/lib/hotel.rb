require_relative "room"

class Hotel
  def initialize(name, hashes)
    @name = name
    @rooms = {} 

    hashes.each do |k,v|
        @rooms[k] = Room.new(v)
    end
  end

  def name
    new_name = []
    @name.split(' ').each do |word|
        new_name << word.capitalize
    end
    new_name.join(' ')
  end

  def rooms
    @rooms
  end
  
  def room_exists?(str)
    @rooms[str] != nil
  end

  def check_in(person, room)
    if room_exists?(room)
        if @rooms[room].add_occupant(person)
            p "check in successful"
        else
            p "sorry, room is full"
        end
    else
        p "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.values.each do |room|
        if room.available_space > 0
            return true
        end
    end
    false
  end 

  def list_rooms
    @rooms.each do |k, v|
        puts "#{k} : #{v.available_space}"
    end
  end
end
