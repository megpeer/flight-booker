class Flight < ApplicationRecord
  belongs_to :arrival_airport,
             class_name: 'Airport',
             foreign_key: 'arrival_airport_id'
  belongs_to :departing_airport,
             class_name: 'Airport',
             foreign_key: 'departing_airport_id'
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings, dependent: :destroy

  def event_date_formatted
    flight.date.strftime('%m/%d/%y')
  end
end
