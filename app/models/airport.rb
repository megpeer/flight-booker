class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: 'departing_airport_id', dependant: :destroy
  has_many :arrival_flights, class_name: 'Flight', foreign_key: 'arrival_airport_id', dependant: :destroy
end
