class Flight < ApplicationRecord
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: 'arrival_airport_id'
  belongs_to :departing_airport, class_name: 'Airport', foreign_key: 'departing_airport_id'
end
