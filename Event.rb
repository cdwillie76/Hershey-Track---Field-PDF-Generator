class Event
  @@field_events = ['Softball Throw', 'Standing Long Jump']
  
  def self.is_field_event?(event)
    @@field_events.include?(event)
  end
end