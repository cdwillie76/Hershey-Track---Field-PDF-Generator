require 'parseexcel'

class HersheyDataParser
  def self.parse_excel_binary(filename)
    workbook = Spreadsheet::ParseExcel.parse(filename) 

    # usually, you want the first worksheet: 
    worksheet = workbook.worksheet(0)

    # this will skip the column heading row
    skip = 1 

    # indicies for the needed columns, zero indexed
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
      yield name, community, event, age_group, time_distance
    }
  end
end