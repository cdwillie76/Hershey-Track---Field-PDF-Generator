require 'test/unit'
require 'pp'

require File.dirname(__FILE__) + '/../hershey_meet_data'

class TestHersheyMeetData < Test::Unit::TestCase
  
  def test_one_participant
    # input data
    test_participant = ['#1 John Doe', 'Cherry Valley', 'Standing Long Jump', 'Boys 9 & 10']
    
    # result data
    boys9_10_standing_long_jump = [['#1 John Doe', 'Cherry Valley', '', '', '', '']]
        
    hershey_meet_data = HersheyMeetData.new
    hershey_meet_data.add_participant( test_participant[0], test_participant[1], test_participant[2], test_participant[3], nil)
    
    hershey_meet_data.each_event_as_array do |age_group, event, participants_array|
      if ((age_group == 'Boys 9 & 10') && (event == 'Standing Long Jump'))
        assert_equal(boys9_10_standing_long_jump, participants_array)
      else
        flunk("Didn't find event")
      end
    end
  end
  
  def test_multiple_participants
    
    # input data
    test_participants =
      [ ['#1 John Doe', 'Cherry Valley', 'Standing Long Jump', 'Boys 9 & 10',"'00:00.50"], 
        ['#2 John Doe', 'Ilion', 'Standing Long Jump', 'Boys 9 & 10',"'05:00.50"],
        ['#3 John Doe', 'Manilus', 'Standing Long Jump', 'Boys 9 & 10',"'05:03.50"],
        ['#4 John Doe', 'Anytown', 'Standing Long Jump', 'Boys 9 & 10',"'15:00.50"],
        ['#5 John Doe', 'Anytown', 'Standing Long Jump', 'Boys 9 & 10',"'03:00.00"],
        ['#6 John Doe', 'Anytown', 'Standing Long Jump', 'Girls 9 & 10',"'03:00.00"],
        ['#7 John Doe', 'Anytown', 'Standing Long Jump', 'Girls 9 & 10',"'12:00.00"],
        ['#8 John Doe', 'Anytown', 'Standing Long Jump', 'Girls 9 & 10',"'03:10.00"],
        ['#9 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10',"'13:00.00"],
        ['#10 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10',"'00:45.25"],
        ['#11 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10',"'00:45.00"],
        ['#12 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10',"'01:10.00"],
        ['#13 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10',"'03:00.00"],
        ['#14 John Doe', 'Anytown', '200 M Dash', 'Girls 9 & 10',"'03:10.00"],
        ['#15 John Doe', 'Anytown', '200 M Dash', 'Girls 9 & 10',"'00:55.25"],
        ['#16 John Doe', 'Anytown', '200 M Dash', 'Girls 9 & 10',"'10:00.00"],
        ['#17 John Doe', 'Anytown', '200 M Dash', 'Girls 9 & 10',"'00:55.00"] ]
    
    # result data
    boys9_10_standing_long_jump =
    [ ['#4 John Doe', 'Anytown', '', '', '', ''],
      ['#3 John Doe', 'Manilus', '', '', '', ''],
      ['#2 John Doe', 'Ilion', '', '', '', ''],
      ['#5 John Doe', 'Anytown', '', '', '', ''],
      ['#1 John Doe', 'Cherry Valley', '', '', '', ''] ]
      
    girls9_10_standing_long_jump = 
    [ ['#7 John Doe', 'Anytown', '', '', '', ''],
      ['#8 John Doe', 'Anytown', '', '', '', ''],
      ['#6 John Doe', 'Anytown', '', '', '', '']]
      
    boys9_10_200m_dash = 
    [ ['#11 John Doe', 'Anytown', '', ''],
      ['#10 John Doe', 'Anytown', '', ''],
      ['#12 John Doe', 'Anytown', '', ''],
      ['#13 John Doe', 'Anytown', '', ''],
      ['#9 John Doe', 'Anytown', '', '']]
    
    girls9_10_200m_dash = 
    [ ['#17 John Doe', 'Anytown', '', ''],
      ['#15 John Doe', 'Anytown', '', ''],
      ['#14 John Doe', 'Anytown', '', ''],
      ['#16 John Doe', 'Anytown', '', '']]
  
    hershey_meet_data = HersheyMeetData.new
    
    # load participants
    test_participants.each {|item|
      hershey_meet_data.add_participant(item[0], item[1], item[2], item[3], item[4])
    }
    
    count_events = 0
    
    hershey_meet_data.each_event_as_array do |age_group, event, participants_array|
      if ((age_group == 'Boys 9 & 10') && (event == 'Standing Long Jump'))
        assert_equal(participants_array, boys9_10_standing_long_jump)
        count_events += 1
      elsif ((age_group == 'Boys 9 & 10') && (event == '200 M Dash'))
        assert_equal(participants_array, boys9_10_200m_dash)
        count_events += 1
      elsif ((age_group == 'Girls 9 & 10') && (event == 'Standing Long Jump'))
        assert_equal(participants_array, girls9_10_standing_long_jump)
        count_events += 1
      elsif ((age_group == 'Girls 9 & 10') && (event == '200 M Dash'))
        assert_equal(participants_array, girls9_10_200m_dash)
        count_events += 1
      else
        flunk("Found event that shouldn't exist")
      end
    end

    assert_equal(count_events, 4)
  end
end