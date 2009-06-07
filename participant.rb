class Participant
  attr_accessor :name, :community, :time_distance
  
  def self.field_event_sort(a, b)
    a_parts = a.time_distance.scan(/'([\d]*):([\d]*).([\d]*)/)
    b_parts = b.time_distance.scan(/'([\d]*):([\d]*).([\d]*)/)
    
    if a_parts[0][0] == b_parts[0][0]
      if a_parts[0][1] == b_parts[0][1]
        if a_parts[0][2] > b_parts[0][2]
          -1
        elsif a_parts[0][2] < b_parts[0][2]
          1
        else
          0
        end
      elsif a_parts[0][1] > b_parts[0][1]
        -1
      else
        1
      end  
    elsif a_parts[0][0] > b_parts[0][0]
      -1
    else
      1
    end
  end
  
  def self.running_event_sort(a, b)
    a_parts = a.time_distance.scan(/'([\d]*):([\d]*).([\d]*)/)
    b_parts = b.time_distance.scan(/'([\d]*):([\d]*).([\d]*)/)
    
    if a_parts[0][0] == b_parts[0][0]
      if a_parts[0][1] == b_parts[0][1]
        if a_parts[0][2] < b_parts[0][2]
          -1
        elsif a_parts[0][2] > b_parts[0][2]
          1
        else
          0
        end
      elsif a_parts[0][1] < b_parts[0][1]
        -1
      else
        1
      end  
    elsif a_parts[0][0] < b_parts[0][0]
      -1
    else
      1
    end
  end
  
  def create_array(event)
    row = []
    row << name.to_s
    row << community.to_s
    if Event.is_field_event?(event)
      4.times do
        row << ''
      end
    else
      2.times do
        row << ''
      end
    end
    
    row
  end
end