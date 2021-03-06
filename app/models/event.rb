class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :description, presence: true
  validates :date, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees, source: :attendee

  scope :upcoming_scope, -> { where('date >= ?', DateTime.now.to_date) }
  scope :previous_scope, -> { where('date < ?', DateTime.now.to_date) }

  def self.upcoming
    Event.upcoming_scope
  end

  def self.previous
    Event.previous_scope
  end
end
