class User
  @@users = {}
  def initialize(name)
    @name = name
  end

  def set_name(name)
    @name = name
    @@users["#{@@user.count}"] = name
  end
 
end

class Building
  
  @@buildings = {}
  def initialize(user_id)
    @name = name
    @user_id = user_id
  end

  def add_name(name)
    @@buildings["#{@@buildings.count}"] = name
    @floor = Floor.new(@@buildings)
  end
 
end


class Floor

  def initialize(building_id)
    @building_id = building_id
    @floor_number = floor_number
  end

  def set_floor_number(floor_number)
    @floor_number = floor_number
  end

end

class Conference

  def initialize
    @users = {} 
    @floor_id = floor_id
    @room_name = room_name
    @slot = []
  end

end


class Booking

  def initialize
    @user_id = user_id
    @building_id = building_id
    @floor_id = floor_id
   @conferend_id = conferend_id
  end
end

user = User.new(name)
user.set_name(name)


input = gets.chomp
def commands
  if input.split(' ').include?('BUILDING')
    @building = Building.new.add_name(input.pop)
  elsif input.split(' ').include?('FLOOR')
    @floor = Floor.new(@building[input[2]], input[3])
    @floor.set_floor_number(input[3])
  elsif input.split(' ').include?('CONFROOM')
    Booking.new()
  elsif input.split(' ').include?('BOOK')
    user = User.new(input[1])
    building = Building.new(user: user, name: input[3])
    building.add_name
    floor = Floor.new(floor_number: input[4], building: building)
    conference = Conference.create(user: user, floor: floor)
    booking = Booking.create(:user => user, :conference => conference, :building_id => input[3], :floor => input[4], :room_name: input[5]).save!
  elsif input.split(' ').include?('CANCEL')
    Booing.where(user_id: input[0], building_id: input[2])
  end

end



