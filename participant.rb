class Participant
  attr_accessor :name, :community, :time_distance
  
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
  
  def self.running_event_sort(event_participants)
    Participant.field_event_sort(event_participants).reverse
  end
  
  def self.field_event_sort(event_participants)
    event_participants = event_participants.sort_by do |s|
      if s.time_distance =~ /'(\d+):(\d+)\.(\d+)/
        [ $1, $2, $3 ].map { |digits| digits.to_i } 
      else
        []
      end
    end
  end
end