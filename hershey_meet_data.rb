class HersheyMeetData
  @@field_events = ['Softball Throw', 'Standing Long Jump']
  
  def initialize
    @age_groups = {}
  end
  
  def add_participant(name, community, event, age_group)
    # create a hash if the age group doesn't exist
    @age_groups[age_group] ||= {}

    # get back the hash of events for the specific age group
    age_group_events = @age_groups[age_group]

    # create an array if the event doesn't exist
    age_group_events[event] ||= []
    participant_array = age_group_events[event]

    # create an array that represents the participant for that age group and event
    participant_info = []
    participant_info << name
    participant_info << community

    # the array needs to have blank elements for the table to print out correctly
    if @@field_events.include?(event)
      4.times do
        participant_info << ''
      end
    else
      2.times do
        participant_info << ''
      end
    end

    # add participant_info to the participant_array
    participant_array << participant_info
  end  
  
  def age_group_count 
    @age_groups.size
  end
  
  def has_age_group?(age_group)
    @age_groups.has_key?(age_group)
  end
  
  def has_event?(age_group, event)
    age_group_events = @age_groups[age_group]
    if age_group_events
      age_group_events.has_key?(event)
    end
  end
  
  def participant_count(age_group, event)
    age_group_events = @age_groups[age_group]
    if age_group_events
      if age_group_events.has_key?(event)
        age_group_events[event].size
      end
    end
  end
  
  def each_event
    @age_groups.each_value do |event|
      event.each_value { |e| yield e }
    end
  end
end