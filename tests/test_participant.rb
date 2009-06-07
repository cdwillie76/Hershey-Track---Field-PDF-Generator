require 'test/unit'
require 'pp'

require File.dirname(__FILE__) + '/../participant'

class TestParticipant < Test::Unit::TestCase
  
  def setup
    @participant_array = []
    
    participant1 = Participant.new
    participant1.name = "#1 John Smith"
    participant1.time_distance = "'00:00.05"
    @participant_array << participant1
    
    participant2 = Participant.new
    participant2.name = "#2 John Smith"
    participant2.time_distance = "'00:08.05"
    @participant_array << participant2
    
    participant3 = Participant.new
    participant3.name = "#3 John Smith"
    participant3.time_distance = "'01:18.10"
    @participant_array << participant3
    
    participant4 = Participant.new
    participant4.name = "#4 John Smith"
    participant4.time_distance = "'00:08.10"
    @participant_array << participant4
    
    participant5 = Participant.new
    participant5.name = "#5 John Smith"
    participant5.time_distance = "'00:18.10"
    @participant_array << participant5
  end
  
  def test_sort_by_field_event
    @participant_array.sort! { |a, b| Participant.field_event_sort(a, b) }
    
    assert_equal("#3 John Smith", @participant_array[0].name)
    assert_equal("#5 John Smith", @participant_array[1].name)
    assert_equal("#4 John Smith", @participant_array[2].name)
    assert_equal("#2 John Smith", @participant_array[3].name)
    assert_equal("#1 John Smith", @participant_array[4].name)
  end
  
  def test_sort_by_running_event
    @participant_array.sort! { |a, b| Participant.running_event_sort(a, b) }
    
    assert_equal("#3 John Smith", @participant_array[4].name)
    assert_equal("#5 John Smith", @participant_array[3].name)
    assert_equal("#4 John Smith", @participant_array[2].name)
    assert_equal("#2 John Smith", @participant_array[1].name)
    assert_equal("#1 John Smith", @participant_array[0].name)
  end
end