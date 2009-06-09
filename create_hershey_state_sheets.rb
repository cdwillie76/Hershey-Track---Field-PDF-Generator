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
  
  hershey_pdf = HersheyPdf.new

  count = 0
    
  hershey_meet_data.each_event_as_array do |age_group, event, participants_array|
    if(count != 0)
      hershey_pdf.start_new_page
    end
    
    hershey_pdf.add_table(age_group, event, participants_array)
    count += 1
  end
  
  hershey_pdf.render_file("test_demo.pdf")
else
  puts 'Usage: ruby create_hershey_state_sheets.rb <excel file>'
end
