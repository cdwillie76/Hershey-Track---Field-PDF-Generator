require 'parseexcel'
require "faster_csv"

class HersheyDataParser
  def self.parse_excel_binary(filename)
    workbook = Spreadsheet::ParseExcel.parse(filename) 

    # usually, you want the first worksheet: 
    worksheet = workbook.worksheet(0)

    # this will skip the column heading row
    skip = 1 

    # indicies for the needed columns, zero indexed
    age_group_index = 16
    event_index = 17
    first_name_index = 18
    last_name_index = 19
    community_index = 21
    time_distance_index = 23

    worksheet.each(skip) { |row| 
      name = row.at(first_name_index).to_s('utf-8') + " " + row.at(last_name_index).to_s('utf-8')
      event = row.at(event_index).to_s('utf-8')
      age_group = row.at(age_group_index).to_s('utf-8')
      community = row.at(community_index).to_s('utf-8')
      time_distance = row.at(time_distance_index).to_s('utf-8')
      yield name, community, event, age_group, time_distance
    }
  end
  
  def self.parse_csv_file(filename)
    
    # indicies for the needed columns, zero indexed
    age_group_index = 3
    event_index = 4
    first_name_index = 6
    last_name_index = 7
    community_index = 8
    time_distance_index = 5

    FasterCSV.foreach( filename, :headers => true ) do |row|
      name = row[first_name_index] + " " + row[last_name_index]
      event = row[event_index]
      age_group = row[age_group_index]
      community = row[community_index]
      time_distance = row[time_distance_index]
      yield name, community, event, age_group, time_distance
    end
  end
end