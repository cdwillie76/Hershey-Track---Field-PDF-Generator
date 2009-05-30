require 'csv'
require 'pp'

csv_contents = CSV.read('sample_data.csv')

age_groups = {}

field_events = ['Softball Throw', 'Standing Long Jump']

# names of the colums in the csv
age_group_index = 0
event_index = 1
first_name_index = 2
last_name_index = 3
community_index = 4

csv_contents.each do |row|
  # extract the age group and event from the row
  age_group_value = row[age_group_index]
  event_value = row[event_index]
  
  # create a hash if the age group doesn't exist
  age_groups[age_group_value] ||= {}
  
  # get back the hash of events for the specific age group
  age_group_events = age_groups[age_group_value]
  
  # create an array if the event doesn't exist
  age_group_events[event_value] ||= []
  athlete_array = age_group_events[event_value]
  
  # create an array that represents the athlete for that age group and event
  athlete_name = row[first_name_index] + " " + row[last_name_index]
  athlete_info = []
  athlete_info << athlete_name
  athlete_info << row[community_index]
  
  # need to make this more generic for all the events
  if event_value == "Softball Throw"
    4.times do
      athlete_info << ''
    end
  else
    2.times do
      athlete_info << ''
    end
  end
  
  # add athlete_info to the athlete_array
  athlete_array << athlete_info
  
end

pp age_groups