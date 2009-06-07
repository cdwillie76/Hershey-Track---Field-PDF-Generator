require 'rubygems' 
require 'prawn'
require 'prawn/layout'

require 'event'

class HersheyPdf
  @@field_events = ['Softball Throw', 'Standing Long Jump']

  attr_accessor :pdf

  def initialize
  end

  def add_table(age_group, event, participants_array)
    pdf.text "New York West Finals", :size => 32
    pdf.text "Age Group - " + age_group, :size => 24
    pdf.text "Event - " + event, :size => 20
  
    if Event.is_field_event?(event)
      create_field_event_table(age_group, event, participants_array)
    else
      create_running_event_table(age_group, event, participants_array)
    end
  end

  private

    def create_running_event_table(age_group, event, participants_array)
      pdf.table participants_array,
        :position => :left,
        :align_headers => :center,
        :headers => ['Number - Name', 'Community', 'Time', 'Place'],
        :column_widths => { 0 => 200, 1 => 100, 2 => 90, 3 => 90 },
        :border_style => :grid,
        :row_colors => ["FFFFFF", "C0C0C0"]
    end

    def create_field_event_table(age_group, event, participants_array)
      pdf.table participants_array,
        :position => :left,
        :align_headers => :center,
        :headers => ['Number - Name', 'Community', 'Distance', 'Distance', 'Distance', 'Place'],
        :column_widths => { 0 => 200, 1 => 100, 2 => 90, 3 => 90, 4 => 90, 5 => 90},
        :border_style => :grid,
        :row_colors => ["FFFFFF", "C0C0C0"]
    end
end
