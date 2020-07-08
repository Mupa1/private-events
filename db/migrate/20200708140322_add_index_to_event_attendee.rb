class AddIndexToEventAttendee < ActiveRecord::Migration[5.2]
  def change
    add_index :event_attendees, :attendee_id
    add_index :event_attendees, :attended_event_id
  end
end
