require 'participant'

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
    participant = Participant.new
    participant.name = name
    participant.community = community

    # add participant_info to the participant_array
    participant_array << participant
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

  def event_array(age_group, event)
    results = []
    age_group_events = @age_groups[age_group]
    if age_group_events
      if age_group_events.has_key?(event)
        event_participants = age_group_events.fetch(event)
        event_participants.each do |participant|
          row = []
          row << participant.name.to_s
          row << participant.community.to_s
          if @@field_events.include?(event)
            4.times do
              row << ''
            end
          else
            2.times do
              row << ''
            end
          end
          results << row
        end
      end
    end
    
    results.to_a
  end
  
  def each_event_as_array
    @age_groups.each do |age_group, event_hash|
      event_hash.each_key do |event|
        yield age_group, event, event_array(age_group, event)
      end
    end
  end
  
  # str.scan(/'([\d]*):([\d]*).([\d]*)/)
  # sort help
  # objects.sort_by {|obj| obj.attribute}
  # http://stackoverflow.com/questions/882070/sorting-an-array-of-objects-in-ruby-by-object-attribute
end
