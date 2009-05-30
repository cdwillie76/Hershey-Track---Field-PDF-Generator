# $LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib'))
require 'rubygems' 
require 'prawn'
require 'prawn/layout' 

Prawn::Document.generate "table_demo.pdf", :page_layout => :landscape do |pdf|
  field_event_data =
    [ ['#1 Benjamin Gebl', 'Cherry Valley', '', '', '', ''], 
      ['#2 Bobby Paddock', 'Ilion', '', '', '', ''],
      ['#3 Langstion Lightcap', 'Manilus', '', '', '', ''],
      ['#4 John Doe', 'Anytown', '', '', '', ''],
      ['#5 John Doe', 'Anytown', '', '', '', ''],
      ['#6 John Doe', 'Anytown', '', '', '', ''],
      ['#7 John Doe', 'Anytown', '', '', '', ''],
      ['#8 John Doe', 'Anytown', '', '', '', ''],
      ['#9 John Doe', 'Anytown', '', '', '', ''],
      ['#10 John Doe', 'Anytown', '', '', '', ''],
      ['#11 John Doe', 'Anytown', '', '', '', ''],
      ['#12 John Doe', 'Anytown', '', '', '', ''],
      ['#13 John Doe', 'Anytown', '', '', '', ''],
      ['#14 John Doe', 'Anytown', '', '', '', ''],
      ['#15 John Doe', 'Anytown', '', '', '', ''],
      ['#16 John Doe', 'Anytown', '', '', '', ''],
      ['#17 John Doe', 'Anytown', '', '', '', ''] ]
  
  running_event_data =
    [ ['#1 Benjamin Gebl', 'Cherry Valley', '', ''], 
      ['#2 Bobby Paddock', 'Ilion', '', ''],
      ['#3 Langstion Lightcap', 'Manilus', '', ''],
      ['#4 John Doe', 'Anytown', '', ''],
      ['#5 John Doe', 'Anytown', '', ''],
      ['#6 John Doe', 'Anytown', '', ''],
      ['#7 John Doe', 'Anytown', '', ''],
      ['#8 John Doe', 'Anytown', '', ''],
      ['#9 John Doe', 'Anytown', '', ''],
      ['#10 John Doe', 'Anytown', '', ''],
      ['#11 John Doe', 'Anytown', '', ''],
      ['#12 John Doe', 'Anytown', '', ''],
      ['#13 John Doe', 'Anytown', '', ''],
      ['#14 John Doe', 'Anytown', '', ''],
      ['#15 John Doe', 'Anytown', '', ''],
      ['#16 John Doe', 'Anytown', '', ''],
      ['#17 John Doe', 'Anytown', '', ''] ]  
  
  # field events page
  pdf.text "New York West Finals", :size => 32
  pdf.text "Age Group - Boys 11 & 12", :size => 24
  pdf.text "Event - Softball Throw", :size => 20
  pdf.table field_event_data,
    :position => :left,
    :align_headers => :center,
    :headers => ['Number - Name', 'Community', 'Distance', 'Distance', 'Distance', 'Place'],
    :column_widths => { 0 => 200, 1 => 100, 2 => 90, 3 => 90, 4 => 90, 5 => 90},
    :border_style => :grid,
    # :header_color => 'f07878',
    # :header_text_color  => "990000",
    # :row_colors => ["FFCCFF","CCFFCC"]
    :row_colors => ["FFFFFF", "C0C0C0"]
    
  pdf.start_new_page
  # running events page
   pdf.text "New York West Finals", :size => 32
   pdf.text "Age Group - Girls 11 & 12", :size => 24
   pdf.text "Event - 100 M Dash", :size => 20
   pdf.table running_event_data,
     :position => :left,
     :align_headers => :center,
     :headers => ['Number - Name', 'Community', 'Time', 'Place'],
     :column_widths => { 0 => 200, 1 => 100, 2 => 90, 3 => 90 },
     :border_style => :grid,
     # :header_color => 'f07878',
     # :header_text_color  => "990000",
     # :row_colors => ["FFCCFF","CCFFCC"]
     :row_colors => ["FFFFFF", "C0C0C0"]
  
end