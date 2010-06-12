require 'rubygems' 
require 'prawn'
require 'prawn/layout'

require 'participant'
require 'hershey_meet_data'
require 'hershey_data_parser'
require 'hershey_pdf'

# argc[0] is the filename to parse
if ARGV[0] != nil
  
  hershey_meet_data = HersheyMeetData.new
  
  HersheyDataParser.parse_excel_binary(ARGV[0]) do |name, community, event, age_group, time_distance|  
    hershey_meet_data.add_participant(name, community, event, age_group, time_distance)
  end
  
  running_events_pdf = HersheyPdf.new
  field_events_pdf = HersheyPdf.new

  running_events_count = 0
  field_events_count = 0
    
  hershey_meet_data.each_event_as_array do |age_group, event, participants_array|
    if Event.is_field_event?(event)
      if(field_events_count != 0)
        field_events_pdf.start_new_page
      end

      field_events_pdf.add_table(age_group, event, participants_array)
      field_events_count += 1
    else
      if(running_events_count != 0)
        running_events_pdf.start_new_page
      end

      running_events_pdf.add_table(age_group, event, participants_array)
      running_events_count += 1
    end
  end
  
  basename = File.basename(ARGV[0], ".xls")
  
  running_events_pdf.render_file(basename + "_running_events.pdf")
  field_events_pdf.render_file(basename + "_field_events.pdf")
else
  puts 'Usage: ruby create_hershey_state_sheets.rb <excel file>'
end