require 'rails_helper'

RSpec.describe Event, type: :model do

  describe 'associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:attendees).through(:event_attendees) }
    it { should have_many(:event_attendees).with_foreign_key(:attended_event_id) }
  end
end
