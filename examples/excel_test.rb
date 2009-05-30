require 'rubygems' 
require 'parseexcel'

# your first step is always reading in the file. 
# that gives you a workbook-object, which has one or more worksheets, 
# just like in Excel you have the possibility of multiple worksheets.

# workbook = Spreadsheet::ParseExcel.parse(ARGV[0])
workbook = Spreadsheet::ParseExcel.parse("Hershey-Report-Detail.xls") 

# usually, you want the first worksheet: 
worksheet = workbook.worksheet(0) 

# now you can either iterate over all rows, skipping the first number of 
# rows (in case you know they just contain column headers) 
skip = 1 
worksheet.each(skip) { |row| 
  # a row is actually just an Array of Cells.. 
  puts row.at(14).to_s + ", " + row.at(15).to_s + ", " + 
    row.at(16).to_s + ", " + row.at(17).to_s + ", " + row.at(21).to_s
  # puts row.at(15)
} 