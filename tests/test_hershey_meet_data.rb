require 'test/unit'
require 'pp'

require '../hershey_meet_data'

class TestHersheyMeetData < Test::Unit::TestCase
  
  def test_one_participant
    test_participant = ['#1 John Doe', 'Cherry Valley', 'Standing Long Jump', 'Boys 9 & 10']
        
    hershey_meet_data = HersheyMeetData.new
    hershey_meet_data.add_participant( test_participant[0], test_participant[1], test_participant[2], test_participant[3])
    
    assert(hershey_meet_data.has_age_group?('Boys 9 & 10'))
    assert(hershey_meet_data.has_event?('Boys 9 & 10', 'Standing Long Jump'))
    assert_equal(1, hershey_meet_data.participant_count('Boys 9 & 10', 'Standing Long Jump'))
    
  end
  
  def test_multiple_participants
    test_participants =
      [ ['#1 John Doe', 'Cherry Valley', 'Standing Long Jump', 'Boys 9 & 10'], 
        ['#2 John Doe', 'Ilion', 'Standing Long Jump', 'Boys 9 & 10'],
        ['#3 John Doe', 'Manilus', 'Standing Long Jump', 'Boys 9 & 10'],
        ['#4 John Doe', 'Anytown', 'Standing Long Jump', 'Boys 9 & 10'],
        ['#5 John Doe', 'Anytown', 'Standing Long Jump', 'Boys 9 & 10'],
        ['#6 John Doe', 'Anytown', 'Standing Long Jump', 'Girls 9 & 10'],
        ['#7 John Doe', 'Anytown', 'Standing Long Jump', 'Girls 9 & 10'],
        ['#8 John Doe', 'Anytown', 'Standing Long Jump', 'Girls 9 & 10'],
        ['#9 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10'],
        ['#10 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10'],
        ['#11 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10'],
        ['#12 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10'],
        ['#13 John Doe', 'Anytown', '200 M Dash', 'Boys 9 & 10'],
        ['#14 John Doe', 'Anytown', '200 M Dash', 'Girls 9 & 10'],
        ['#15 John Doe', 'Anytown', '200 M Dash', 'Girls 9 & 10'],
        ['#16 John Doe', 'Anytown', '200 M Dash', 'Girls 9 & 10'],
        ['#17 John Doe', 'Anytown', '200 M Dash', 'Girls 9 & 10'] ]
        
    hershey_meet_data = HersheyMeetData.new
    
    test_participants.each {|item|
      hershey_meet_data.add_participant(item[0], item[1], item[2], item[3])
    }
    
    assert(hershey_meet_data.has_age_group?('Boys 9 & 10'))
    assert(hershey_meet_data.has_event?('Boys 9 & 10', 'Standing Long Jump'))
    assert_equal(5, hershey_meet_data.participant_count('Boys 9 & 10', 'Standing Long Jump'))
    assert(hershey_meet_data.has_age_group?('Boys 9 & 10'))
    assert(hershey_meet_data.has_event?('Boys 9 & 10', '200 M Dash'))
    assert_equal(5, hershey_meet_data.participant_count('Boys 9 & 10', '200 M Dash'))
    
    assert(hershey_meet_data.has_age_group?('Girls 9 & 10'))
    assert(hershey_meet_data.has_event?('Girls 9 & 10', 'Standing Long Jump'))
    assert_equal(3, hershey_meet_data.participant_count('Girls 9 & 10', 'Standing Long Jump'))
    assert(hershey_meet_data.has_age_group?('Girls 9 & 10'))
    assert(hershey_meet_data.has_event?('Girls 9 & 10', '200 M Dash'))
    assert_equal(4, hershey_meet_data.participant_count('Girls 9 & 10', '200 M Dash'))
    
    hershey_meet_data.each_event {|event|
      pp event
    }
  end
  
end