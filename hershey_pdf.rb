require 'rubygems' 
require 'prawn'
require 'prawn/layout'

require 'event'

class HersheyPdf

  def initialize
    @pdf = Prawn::Document.new(:page_layout => :landscape)
    # @pdf.font "Helvetica"
  end

  def add_table(age_group, event, participants_array)
    header_text = "New York West Finals - " + age_group + " - " + event
    
    @pdf.font "Helvetica", :style => :normal
    @pdf.text header_text, :size => 24
    @pdf.font "Helvetica", :style => :bold
  
    if Event.is_field_event?(event)
      create_field_event_table(age_group, event, participants_array)
    else
      create_running_event_table(age_group, event, participants_array)
    end
  end
  
  def start_new_page
    @pdf.start_new_page
  end
  
  def render_file(filename)
    @pdf.render_file filename
  end

  private

    def create_running_event_table(age_group, event, participants_array)
      @pdf.table participants_array,
        :position => :left,
        :align_headers => :center,
        :headers => ['Number - Name', 'Community', 'Time', 'Place'],
        :column_widths => { 0 => 200, 1 => 110, 2 => 100, 3 => 100 },
        :border_style => :grid,
        :row_colors => ["FFFFFF", "F5F5F5"],
        :vertical_padding => 10
    end

    def create_field_event_table(age_group, event, participants_array)
      @pdf.table participants_array,
        :position => :left,
        :align_headers => :center,
        :headers => ['Number - Name', 'Community', 'Distance', 'Distance', 'Distance', 'Place'],
        :column_widths => { 0 => 200, 1 => 110, 2 => 100, 3 => 100, 4 => 100, 5 => 100},
        :border_style => :grid,
        :row_colors => ["FFFFFF", "F5F5F5"],
        :vertical_padding => 10
    end
end