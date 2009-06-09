require 'event'
require 'participant'

class HersheyMeetData
  def initialize
    @age_groups = {}
  end

  def add_participant(name, community, event, age_group, time_distance)
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
    participant.time_distance = time_distance

    # add participant_info to the participant_array
    participant_array << participant
  end

  def each_event_as_array
    @age_groups.each do |age_group, event_hash|
      event_hash.each_key do |event|
        yield age_group, event, event_array(age_group, event)
      end
    end
  end

  private 
  
  def event_array(age_group, event)
    results = []
    age_group_events = @age_groups[age_group]
    if age_group_events
      if age_group_events.has_key?(event)
        event_participants = age_group_events.fetch(event)
        
        if Event.is_field_event?(event)
          event_participants = Participant.field_event_sort(event_participants)
        else
          event_participants = Participant.running_event_sort(event_participants)
        end
        
        event_participants.each do |participant|
          results << participant.create_array(event)
        end
      end
    end
    
    results.to_a
  end
end