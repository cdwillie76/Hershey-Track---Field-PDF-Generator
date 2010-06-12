require 'rubygems' 
require 'prawn'
require 'prawn/layout'

require 'participant'
require 'hershey_meet_data'
require 'hershey_data_parser'
require 'hershey_pdf'


class HersheyStateSheets
  def initialize(excel_file)
    @excel_file = excel_file
  end
  
  def create_pdfs()
    hershey_meet_data = HersheyMeetData.new

    HersheyDataParser.parse_excel_binary(@excel_file) do |name, community, event, age_group, time_distance|  
      hershey_meet_data.add_participant(name, community, event, age_group, time_distance)
    end

    running_events_pdf = HersheyPdf.new
    field_events_pdf = HersheyPdf.new

    running_events_count = 0
    field_events_count = 0

    hershey_meet_data.each_event_as_array do |age_group, event, participants_array|
      if Event.is_field_event?(event)
        field_events_count = add_table(field_events_pdf, field_events_count, age_group, event, participants_array)
      else
        running_events_count = add_table(running_events_pdf, running_events_count, age_group, event, participants_array)
      end
    end

    basename = File.basename(@excel_file, ".xls")

    running_events_pdf.render_file(basename + "_running_events.pdf")
    field_events_pdf.render_file(basename + "_field_events.pdf")
  end
  
  def add_table(pdf, count, age_group, event, participants_array)
    if(count != 0)
      pdf.start_new_page
    end

    pdf.add_table(age_group, event, participants_array)
    count += 1
  end
end

# argc[0] is the filename to parse
if ARGV[0] != nil
  hershey_state_sheets = HersheyStateSheets.new(ARGV[0])
  hershey_state_sheets.create_pdfs
else
  puts 'Usage: ruby create_hershey_state_sheets.rb <excel file>'
end