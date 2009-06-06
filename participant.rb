class Participant
  attr_accessor :name, :community, :time_distance
  
  # TODO: Not finished and might not be the way to do it
  def <=>(a, b)
    a_time_distance_parts = a.time_distance.scan(/'([\d]*):([\d]*).([\d]*)/)
    b_time_distance_parts = b.time_distance.scan(/'([\d]*):([\d]*).([\d]*)/)
    
    
  end
end