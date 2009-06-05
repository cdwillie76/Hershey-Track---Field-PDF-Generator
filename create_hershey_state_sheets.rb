require 'rubygems' 
require 'prawn'
require 'prawn/layout'
require 'parseexcel'

require 'participant'
require 'hershey_meet_data'
require 'hershey_pdf'

if ARGV[0] != nil
  workbook = Spreadsheet::ParseExcel.parse(ARGV[0]) 

  # usually, you want the first worksheet: 
  worksheet = workbook.worksheet(0)
  
  hershey_meet_data = HersheyMeetData.new
  
  # this will skip the column heading row
  skip = 1 
  
  # indicies for the needed columns
  age_group_index = 14
  event_index = 15
  first_name_index = 16
  last_name_index = 17
  community_index = 19
  time_distance_index = 21
  
  worksheet.each(skip) { |row| 
    name = row.at(first_name_index).to_s('utf-8') + " " + row.at(last_name_index).to_s('utf-8')
    event = row.at(event_index).to_s('utf-8')
    age_group = row.at(age_group_index).to_s('utf-8')
    community = row.at(community_index).to_s('utf-8')
    time_distance = row.at(time_distance_index).to_s('utf-8')
    
    hershey_meet_data.add_participant(name, community, event, age_group)
  }
  
  hershey_pdf = HersheyPdf.new
  
  Prawn::Document.generate "table_demo.pdf", :page_layout => :landscape do |pdf|
    pdf.font "Helvetica"
    hershey_pdf.pdf = pdf
    count = 0
    
    hershey_meet_data.each_event_as_array do |age_group, event, participants_array|
      if(count != 0)
        pdf.start_new_page
      end
    
      hershey_pdf.add_table(age_group, event, participants_array)
      count += 1
    end
  end
else
  puts 'Usage: ruby create_hershey_state_sheets.rb <excel file>'
end
