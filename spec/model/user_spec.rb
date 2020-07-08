require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'associations' do
    it { should have_many(:events).class_name('Event').with_foreign_key(:creator_id) }
    it { should have_many(:attended_event).through(:event_attendees) }
    it { should have_many(:event_attendees).with_foreign_key(:attendee_id) }
  end
  
end